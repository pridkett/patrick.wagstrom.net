title: Time Synchronization with VMWare
timestamp: 08:49 PM Friday, February 15, 2008 EST
status: published
slug: vmware-time-synchronization
tags:
- computer
- virtualization
- system administration
- linux
- time
- howto
- vmware
url: /weblog/2008/02/15/vmware-time-synchronization/

layout: post
oldcategories:
- computer
oldtags:
- howto
- linux
- system administration
- time
- virtualization
- vmware
wordpress_id: '342'

---

One of the major issues with utilizing a virtual machine for a server is that of time synchronization.  VMWare normally has access to a real time clock handler that helps to synchronize time, but even that causes time to skew.  This issue becomes more prominent with modern processors that support CPU frequency scaling.  However, there are many cases where even the VMWare custom kernel module can't manage the time skew properly.  Such was the case with my updated VMWare virtual machine -- to put it simply, time had stopped.

Looking around, it appears that some of the problem may be to the new tickless features in the linux kernel.  Basically, this feature allows the system to stop waking up periodically if there is nothing to do. On desktop and laptop machines this saves a lot of power and is a key feature that has helped the [OLPC](http://www.laptop.org/) be such a power miser.  However, it also really screws with the clocks in virtual machines, and may be cause of other issues.  I've also read that there are issues with heavy disk I/O and Gutsy in VMWare Server -- which is my virtualization platform of choice.

Previously, with the time issue, I would fix problems by adding in a cron job to periodically synchronize the date with a remote system. It's important to note, that ntp won't work because it tries to gradually synchronize the time -- so it will never catch up.  However, using a cron job on the virtualized system relies on the virtualized system eventually hitting even minute marks.  Last night in the course of 12 hours, my time advanced 32 seconds; cron is not an option. The solution is to have the host operating system, which can keep time, periodically SSH into the virtualized machine and synchronize the time.  Getting started, you'll need to activate the time service in xinetd on the host operating system.  Open up /etc/xinetd.d/time and change the lines that say

    
    disable = yes


to say "no".  Restart xinetd by running /etc/init.d/xinetd restart and you'll now be able to rdate to your host machine.

The next step is to create the ssh key and setup the cron job to connect to guest operating system.  These commands should do it for you.  Hit enter to leave it without a passphrase.  Then, copy the key to the guest operating system.

    
    root@host:~# ssh-keygen -t dsa -C "automated RDATE ssh key" -f id_dsa.rdate
    Generating public/private dsa key pair.
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    Your identification has been saved in id_dsa.rdate.
    Your public key has been saved in id_dsa.rdate.pub.
    The key fingerprint is:
    d4:5f:01:83:ee:df:e0:e4:ea:ff:0a:6e:50:d1:e2:d3 automated RDATE ssh key
    root@host:~# scp id_dsa.rdate.pub USERACCOUNT@GUEST:


Now that the key is on the guest, it's time to enable a passwordless login.  First, login to the guest machine, and open up a root shell using sudo -s.  Then run the following command to add the new key to your ~/root/.ssh/authorized_keys.

    
    echo 'command="rdate -s HOST"' $(cat id_dsa.rdate.pub) >> ~root/.ssh/authorized_keys


The final step is to edit your /etc/crontab on your host system, and make the time synchronization happen every five minutes or so.

    
    */5 * * * * root ssh -i ~root/.ssh/id_dsa.rdate root@GUEST "rdate -s HOST"


Now, you should have a nice infrastructure set up where your VMWare virtual machine will never be more than five minutes away from the actual time.  It's important to note that there are a few alternative ways of doing this.  For example, one could bypass the usage of rdate entirely through some clever shell scripting that passes the time on the host system to the time command on the remote system.  In my experience, this works in a homogeneous environment, but not every system can interpret times in the same way, so sticking with rdate seems like a good compromise.
