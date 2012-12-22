title: LVM with MythTV on Ubuntu
timestamp: 11:19 AM Tuesday, September 27, 2005 EDT
status: published
slug: mythtv-lvm
tags:
- lvm
- howto
- mythtv
- linux
url: /weblog/2005/09/27/mythtv-lvm/

layout: post
oldcategories:
- mythtv
oldtags:
- howto
- linux
- lvm
- mythtv
wordpress_id: '162'

---

Last night I was pleasantly surprised to find that my new hard disk from [Outpost.com/Fry's](http://www.outpost.com/) had already arrived, despite ordering it on Friday and only paying for ground shipping.  Note to the other folks from [the Burgh](http://maps.google.com/maps?q=pittsburgh,+pa&spn=0.086881,0.135844&t=h&hl=en), Outpost ships from [Columbus](http://maps.google.com/maps?q=columbus,+oh&spn=0.087497,0.135844&t=h&hl=en), thus you get your stuff fast.  Having received this nice shiny new 200GB hard disk, I needed a way to integrate into my system.  I consider this disk to be a stop-gap solution until I can afford a [RAID-5](http://www.pcguide.com/ref/hdd/perf/raid/levels/singleLevel5-c.html) setup.

Anyway, before I began this little adventure, I was running low on storage space.  I keep my [MythTV](http://www.mythtv.org/) recordings in `/mnt/store` and the 200G drive I picked up in February was now loaded down with lots of [Simpsons](http://www.snpp.com/), [Family Guy](http://www.familyguyfiles.com/), and various movies.  The overall disk picture looked something like this:

    patrick@dreams:~# df -h
    Filesystem            Size  Used Avail Use% Mounted on
    /dev/hda6              33G   24G  6.9G  78% /
    tmpfs                 380M     0  380M   0% /dev/shm
    /dev/hda1              90M   24M   62M  28% /boot
    /dev/hdc1             190G  185G  1.9G  98% /mnt/store
    /dev/hda5             9.3G  8.7G  601M  94% /home
    /dev                   33G   24G  6.9G  78% /.dev
    none                  5.0M  2.8M  2.3M  56% /dev

In addition, I have an NEC DVD dual layer burner on `/dev/hdb`.  My task at hand was to merge the new 200GB disk with the existing 200GB disk.  I had a variety of possible tools for this, including just a bunch of symlinks to the old files, [unionfs](http://www.fsl.cs.sunysb.edu/project-unionfs.html), and [LVM](http://sources.redhat.com/lvm2/).  Symlinks might work okay, but there is a lot of manual work that needs to be done.  On the bright side, if I lose a disk with that method, I only lose the recordings on that disk.  UnionFS allows me to ignore the symlink problem and stack the two drives.   However, one drive would be read only, so it would never get any more full.  This really wasn't desirable either.  Really, I need some sort of RAID setup.  Not so much for the redundancy, but for the consistent disk image across drives.

So normally what I'd be looking for is called [RAID-0](http://www.pcguide.com/ref/hdd/perf/raid/levels/singleLevel0-c.html) or [JBOD](http://www.pcguide.com/ref/hdd/perf/raid/levels/jbod-c.html) (Just a bunch of disks).  The difference between the two is that RAID-0 stripes the data between the disks, meaning that different chunks of the data are on different disks.  This gives increased I/O throughput provided that the disks are on different controllers.  JBOD just concatenates the disks together as one big disk and when the first disk fills up, work begins on the second disk.  The problem is that both of these would require me to blow away both drives to get going.  I'm not about to try and find all those Simpsons expisodes again.  Furthermore, if I ever wanted to add more disks to this setup, I'd still have to go this pain again.  This was not desirable.

Enter the joy of LVM for Linux.  LVM stands for Logical Volume Management, and it's a method that you can be completely agnostic about the underlying disk setup for a mount point.  The current version is LVM 2 and most distros ship with LVM2 support enabled (Ubuntu works just fine with LVM).  The basic concept with LVM is that at the top level you have the concept of a volume group. This is a group of disks that you can create many mount points out of.  For most users, you'll be fine with just one volume group, but if you're going to be doing a lot of moving of disks, you might want to have different volume groups to make things easier. Within a volume group you have a collection of physical volumes, which are essentially just block devices.  Under Linux this means that you can either dedicate an entire disk or just a partition of a disk.  In my case, I was dedicating two entire disks to LVM. This means that I get an extra 1K of space by not needing the partition table at the front of the disk.  Woohoo.  So, my first step was to initialize the new hard disk, now called `/dev/hdb` as an LVM physical volume.

    root@dreams:~# pvcreate /dev/hdb

With an initial physical volume created, it's possible to move on and create a volume group.  Like I stated earlier, for most home users, having a single volume group will be just fine.  Especially if you're just using it for MythTV. To get things started, I created a volume group called mythtv_store to indicate that I was using it for MythTV and told LVM that I would be using `/dev/hdb` as the first physical volume in the group.  You'll also need to tell LVM that the volume group is accessible.  This is what the second command does.

    root@dreams:~# vgcreate mythtv_store /dev/hdb
    rootodreams:~# vgchange -a y mythtv_store

The final thing that you'll need if you want to access your disk is to create a logical volume on top of the volume group.  It's possible to use LVM to set up all sorts of fun stuff like striping between disks, but we're not going to be doing that because we're starting with just one disk.  We want the setup to take up the entirety of the disk currently allocated to the volume group.  To do that we first figure out how many physical extents we have in the volume group.  A physical extent is a chunk of a physical disk that can be allocated to a logical volume.  When we run the `vgdisplay` command (more about that later), we'll how man physical extents the drive has by looking at the line that says Total PE.  For convenience and confusion sake, we'll call our new logical volume mythtv.
    
    root@dreams:~# vgdisplay mythtv_store | grep "Total PE"
      Total PE              47695
    root@dreams:~# lvcreate -l 47695 mythtv_store -n mythtv

If you're interested in seeing what's going on you can run pvdisplay to show the physical volumes, vgdisplay to show the volume groups you've just created, and `lvdisplay` to show the logical volumes.  Here's the output from my system (somewhat faked as I'm writing this after creating the LVM setup):
    
    root@dreams:~# pvdisplay
      --- Physical volume ---
      PV Name               /dev/hdb
      VG Name               mythtv_store
      PV Size               186.31 GB / not usable 0
      Allocatable           yes (but full)
      PE Size (KByte)       4096
      Total PE              47695
      Free PE               0
      Allocated PE          47695
      PV UUID               e5obta-U4u1-gdWB-DwGP-MTBo-Lpw5-1O7rVK
    
    root@dreams:~# vgdisplay
      --- Volume group ---
      VG Name               mythtv_store
      System ID
      Format                lvm2
      Metadata Areas        2
      Metadata Sequence No  5
      VG Access             read/write
      VG Status             resizable
      MAX LV                0
      Cur LV                1
      Open LV               1
      Max PV                0
      Cur PV                2
      Act PV                2
      VG Size               186.27 GB
      PE Size               4.00 MB
      Total PE              47695
      Alloc PE / Size       47695 / 186.27 GB
      Free  PE / Size       0 / 0
      VG UUID               2uX3MD-1386-FqXx-LMEJ-ELOW-nB58-UNEoTl
    
    root@dreams:~# lvdisplay
      --- Logical volume ---
      LV Name                /dev/mythtv_store/mythtv
      VG Name                mythtv_store
      LV UUID                CbjYXs-gWnC-63X6-ED2D-x3BS-PbkC-td0OT4
      LV Write Access        read/write
      LV Status              available
      # open                 1
      LV Size                186.27 GB
      Current LE             47695
      Segments               1
      Allocation             inherit
      Read ahead sectors     0
      Block device           254:0


The first line of the lvdisplay output is what we're looking for.  This is the device name that you'll use to access the logical volume, in my case it is `/dev/mythtv_store/mythtv`.  In general it goes by the name of `/dev/[VOLUME GROUP NAME]/[LOGICAL VOLUME NAME]`.  From here we can see that we've got a 186.27 GB logical disk that we've just created.  The next step is to format the thing and port our data over.  I've been using JFS because it has speedy deletes for the large files that MythTV produces, however, you may want to consider using EXT3 or ReiserFS.  The main reason is because you cannot shrink a JFS drive (or XFS for that matter).  If you want a filesystem you can shrink, you must use EXT3 or ResierFS (at least at this time).  Anyway, here's how I formatted the drive, mounted it, and copied all my data from the old drive over (the old drive was mounted at `/mnt/store`).

    root@dreams:~# mkfs.jfs /dev/mythtv_store/mythtv
    root@dreams:~# mkdir /mnt/tmp
    root@dreams:~# mount /dev/mythtv_store/mythtv /mnt/tmp
    root@dreams:~# cp -a /mnt/store /mnt/tmp

A quick look shows that all my files copied successfully.  If you haven't already, now would be a good time to shut down MythBackend, but lets hope you did that a long time ago.  Now comes the part that you'll feel queasy about, but it should work.  We're going to blow away the old disk, add it to the volume group, and then extend that logical volume and our JFS file system.  The first thing that we need to do is blow away the partition table on /dev/hdc.  This is necessary because LVM doesn't like seeing a partition table there if it's going to use the whole disk.  Thanks to dd this is pretty straight forward.
    
    root@dreams:~# dd if=/dev/zero of=/dev/hdc bs=1k count=1
    root@dreams:~# pvcreate /dev/hdc
    root@dreams:~# vgextend mythtv_store /dev/hdc

These steps have added `/dev/hdc` to the volume group, but it hasn't yet been added to the logical volume.  To do that we're going to need to know the total size of volume group.  Once again, grep becomes our friend, and we use the following commands:

    root@dreams:~# vgdisplay mythtv_store | grep "Total PE"
      Total PE              96315
    root@dreams:~# lvextend -l 96315 /dev/mythtv_store/mythtv

Now if we run lvdisplay we'll see that the disk has been extened.  However, looking at the output of df it's clear that the disk space has not been increased.  This is because we haven't told JFS to extend the disk yet.
    
    root@dreams:~# lvdisplay
      --- Logical volume ---
      LV Name                /dev/mythtv_store/mythtv
      VG Name                mythtv_store
      LV UUID                CbjYXs-gWnC-63X6-ED2D-x3BS-PbkC-td0OT4
      LV Write Access        read/write
      LV Status              available
      # open                 1
      LV Size                376.23 GB
      Current LE             96315
      Segments               2
      Allocation             inherit
      Read ahead sectors     0
      Block device           254:0
    
    root@dreams:~# df
    Filesystem            Size  Used Avail Use% Mounted on
    /dev/hda6              33G   24G  6.9G  78% /
    tmpfs                 380M     0  380M   0% /dev/shm
    /dev/hda1              90M   24M   62M  28% /boot
    /dev/mapper/mythtv_store-mythtv
                          186G  185G  739M  99% /mnt/store
    /dev/hda5             9.3G  8.7G  601M  94% /home
    /dev                   33G   24G  6.9G  78% /.dev
    none                  5.0M  2.8M  2.3M  56% /dev

The final step is to tell JFS to resize the mounted filesystem.  In order to do this, JFS needs to execute a remount/resize command.  This means that you need to have the filesystem mounted, then execute the following command:
    
    root@dreams:~# mount -o remount,resize /mnt/store

If all goes well, it will take a few seconds to mount the disk, and then you'll have a nice big disk to store all of your MythTV recordings on.  Here's the final output from the important commands on my system:
    
    root@dreams:~# pvdisplay
      --- Physical volume ---
      PV Name               /dev/hdb
      VG Name               mythtv_store
      PV Size               186.31 GB / not usable 0
      Allocatable           yes (but full)
      PE Size (KByte)       4096
      Total PE              47695
      Free PE               0
      Allocated PE          47695
      PV UUID               e5obta-U4u1-gdWB-DwGP-MTBo-Lpw5-1O7rVK
    
      --- Physical volume ---
      PV Name               /dev/hdc
      VG Name               mythtv_store
      PV Size               189.92 GB / not usable 0
      Allocatable           yes (but full)
      PE Size (KByte)       4096
      Total PE              48620
      Free PE               0
      Allocated PE          48620
      PV UUID               0poKpC-804L-kWvX-D97a-23Fc-L4UT-6HWObk
    
    root@dreams:~# vgdisplay
      --- Volume group ---
      VG Name               mythtv_store
      System ID
      Format                lvm2
      Metadata Areas        2
      Metadata Sequence No  5
      VG Access             read/write
      VG Status             resizable
      MAX LV                0
      Cur LV                1
      Open LV               1
      Max PV                0
      Cur PV                2
      Act PV                2
      VG Size               376.23 GB
      PE Size               4.00 MB
      Total PE              96315
      Alloc PE / Size       96315 / 376.23 GB
      Free  PE / Size       0 / 0
      VG UUID               2uX3MD-1386-FqXx-LMEJ-ELOW-nB58-UNEoTl
    
    root@dreams:~# lvdisplay
      --- Logical volume ---
      LV Name                /dev/mythtv_store/mythtv
      VG Name                mythtv_store
      LV UUID                CbjYXs-gWnC-63X6-ED2D-x3BS-PbkC-td0OT4
      LV Write Access        read/write
      LV Status              available
      # open                 1
      LV Size                376.23 GB
      Current LE             96315
      Segments               2
      Allocation             inherit
      Read ahead sectors     0
      Block device           254:0
    
    root@dreams:~# df
    Filesystem           1K-blocks      Used Available Use% Mounted on
    /dev/hda6             33645952  24729060   7207756  78% /
    tmpfs                   388228         0    388228   0% /dev/shm
    /dev/hda1                91599     24143     62569  28% /boot
    /dev/mapper/mythtv_store-mythtv
                         394461228 179175688 215285540  46% /mnt/store
    /dev/hda5              9732200   9116892    615308  94% /home
    /dev                  33645952  24729060   7207756  78% /.dev
    none                      5120      2856      2264  56% /dev
