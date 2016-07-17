---
date: '2009-05-08T14:12:00-04:00'
old:
  layout: post
  oldcategories:
  - linux
  status: published
  timestamp: 02:12 PM Friday, May 08, 2009 EDT
  wordpress_id: '729'
oldtags:
- backup
- command line
- dd
- linux
slug: simple-full-disk-image-backups-with-dd
tags:
- dd
- command line
- backup
- linux
title: Simple Full Disk Image Backups With dd
url: /weblog/2009/05/08/simple-full-disk-image-backups-with-dd/
---

After obtaining a new laptop one of the first things I always do is to make an image of the primary hard drive.  I then copy this image to another computer with a lot of hard disk space and leave it there as a backup should something ever go really wrong with the laptop.  There are a variety of tools both commercial and Open Source that make this process relatively easy.  The most well known tools are probably [Norton Ghost](http://www.symantec.com/norton/ghost) and [Acronis TrueImage](http://www.acronis.com/).  In the Open Source world there are some decent alternatives such as [FOG](http://www.fogproject.org/) and [PartImage](http://www.partimage.org/).  Most of these tools have varying levels of intelligence that allow them to copy only the bits of the filesystem that are in use, dramatically reducing the amount of space that it takes to create an image.

However, all these solutions require me to actually obtain the software and create images will only work with that specific software. The not only results in me needed to download additional software, but also needing to hope that the software continues to be maintained in the future.  As I don't want to be locked into a single piece of software what may not be maintained in the future, I typically do my backups with a much more simple tool, the standard unix tool dd.

The manual page for dd says that it "cop[ies] and converts a file".  In this case, I take advantage of the fact that all block devices present themselves as files under Linux and simply make a copy of the hard drive using that method.  If I need to restore the image in the future, I just write the image back to the hard drive using dd.

Because more and more computers are shipping without CD/DVD drives, especially in the category of netbooks and ultraportables we can't just use a Linux live CD.  In my case, I've used this method to back up an IBM Thinkpad x31 and a Lenovo Thinkpad x61 tablet, neither of which have optical drives.  The first step is to create a bootable USB stick with a Linux image on the disk.  You'll use this to boot into Linux and run dd -- after all, you can't image a drive if you're currently using it.  There are various tools to do this, but I've had really great luck with [UNetbootin](http://unetbootin.sourceforge.net/).  If you want to use the very simple method, you can just download the software, and it will take care of automatically downloading the CD image and coping it to the USB stick to make it bootable.  It also provides an option to take an ISO image already on your hard drive and make it bootable on the USB stick.  Because it has excellent hardware support and the install CD is also a live CD, I usually use the latest version of [Ubuntu](http://www.ubuntu.com/).

With the USB stick in hand, simply boot the computer you wish to clone from the USB drive.  Once the Linux desktop appears open up a terminal and use sudo to become root (note: some Linux images have you running root all the time).  Now you're going to use the dd command to make an image of the primary hard disk, which in newer machines is /dev/sda (some older machines may have it as /dev/hda).  Except that we need someplace to store the image, most of the time if you've put a Linux CD image on a USB drive it will not be writable, so unless you've got another large USB storage device, you'll need to copy it across the network to another machine.  Here's a diagram of what we're going to do:

<div class="image caption center">
    <img src="/weblog/media/2009/05/dddriveimage.png" alt="Drive Imaging Process">
    <p>Drive Imaging Process</p>
</div>

Orange is operations that will happen on the local computer, and blue is operations that will happen on the remote computer where the image will be stored.  Files generated through this process can be pretty large, so doing this over a wired network is going to work better.

In the first step, we use dd to read the data from the hard disk, this is then piped via a standard unix pipe to bzip2, which will compress the data.  Alternatively at this point you can use gzip if you're worried about the CPU overhead.  This is a long process that I usually let run for a couple of hours.  From there the output of bzip2 is sent to SSH, which connects to SSH on the remote machine.  Then, as we're still dealing with standard output, we can use cat to redirect the output to a file.  This entire operation can be done with a single command and without the need to create any intermediate files.

    :::bash
    dd if=/dev/sda of=/dev/stdout bs=1M | bzip2 | ssh USERNAME@remotehost "cat - > drive.img.bz2"


There are a few parameters which may need a bit of explanation.  With regards to dd, the if and of arguments specify the input and output file, here we use /dev/stdout to indicate that we want dd to send the output to standard output.  I also set the blocksize to 1 megabyte with the bs argument.  This is then sent to bzip2 which will compress the standard input stream and send it to standard output.  SSH then takes this information, logs onto remote computer "remotehost" as user "USERNAME", and then uses cat to save the image to a file.  This process will not show any sort of progress as you do it.  You can get a rough idea of how much data has been processed by looking at the size of drive.img.bz2 on the remote machine.  In my experience images created this way tend to be about 1/10th the size of the drive.  Alternatively, you can work the [pv](http://www.ivarch.com/programs/pv.shtml) command into your commands to get a better estimate of progress.  To restore the drive image to the drive, you can use the following command:

    :::bash
    ssh USERNAME@remotehost "cat drive.img.bz2" | bzip2 -dc | dd if=/dev/stdin of=/dev/sda bs=1M


In most cases you can even use this method if you upgrade to a different disk, but you'll need to run something like [gparted](http://gparted.sourceforge.net/) or [Partition Magic](http://www.symantec.com/norton/partitionmagic) to update the size of the filesystem and do some small repairs on the drive after restoring the image.

This method doesn't generate the smallest files possible -- notably if you're working with a disk that has already been used many times, it will not generate good compression because many of the old bits are still floating around on the disk.  More advanced solutions take into account the structure of the filesystem and just code that large segments are supposed to have no data, which can provide substantial savings.  However, for a method that is quick and works with almost every system out there, I've found that this works wonders, and I know that dd isn't going anywhere.