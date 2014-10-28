title: Faster Transcoding on AMD Athlon 64's
timestamp: 11:18 AM Friday, January 13, 2006 EST
status: published
slug: faster-transcoding
tags:
- powernow
- transcoding
- powernowd
- mythtv
- power saving
- ubuntu
url: /weblog/2006/01/13/faster-transcoding/

layout: post
oldcategories:
- mythtv
oldtags:
- mythtv
- power saving
- powernow
- powernowd
- transcoding
- ubuntu
wordpress_id: '173'

---

If you're running MythTV on an Athlon 64 platform, you've probably noticed that the CPU throttles itself down when transcoding and cutting commercials despite the fact that your processor may show as being 100% utilized.  This results in much slower transcoding than one would normally expect, but saves a small amount of power.

However, if you record a lot of stuff, or even a moderate amount of stuff in HD, this property and increased delay can be quite annoying.  It can take several extra hours to cut and transcode an hour long HDTV program when running at 1.2GHz instead of 2.4GHz (my analysis shows a greater then 2.5x slowdown - which is weird in itself).  First, let's cover the reason you system slow down, and then we'll cover what to do about it.

Processors take a lot of power - most of that power is dissipated as heat because of the resistance in the CPU.  Slowly, [AMD](http://www.amd.com/) and [Intel](http://www.intel.com/) are realizing that people don't want extra heaters in their living room/office, that powering all of these computers puts a real dent in your wallet, and that most of the energy is wasted because the processor is idle anyway.  The solution?  Create not only more effecient processors, but also allow processors that throttle back to conserve power when they're not being fully utilized.  On the Athlon 64 platform this is called "[Cool'n'Quiet](http://www.amd.com/us-en/Processors/ProductInformation/0,,30_118_9485_9487%5E10272,00.html)" and has been available since the Winchester core chips.

Cool'n'Quiet works with a couple of different parts: a Cool'n'Quiet enabled processor, a Cool'n'Quiet enabled motherboard, and a software program that manages it all.  If you're running a socket 939 Athlon 64, you've almost certainly got the first two.  Under Linux, you can directly control the CPU power state through the proc file system, or you can have a daemon process, such as powernowd, manage it for you.  [Ubuntu](http://www.ubuntu.com/) installs powernowd automatically and starts it for you, so out of the box you're getting some of the benefits of this technology.

However, powernowd is configured to not take into account nice processes.  Normally, this is fine, nice processes can afford to run a bit slower, that's why they're nice in the first place.  Unfortunately, it is only set up to consider nice processes as a group and can't differentiate between a process that can't take advantage of increase speed and one that can, such as transcoding.  And, as you've probably guessed by now, to minimize interference with other programs, [MythTV](http://www.mythtv.org/) runs transcoding and commercial flagging processes as nice. To speed them up all we need to do is tell powernowd to take into account nice processes.

In Ubuntu, this is really straight forward.  Most startup scripts for daemons look in the /etc/default directory for local configuration overrides.  By default powernow is run with only the -q flag, telling it to be quiet. If we also pass the -n flag, it will take nice processes into account when deciding whether or not to throttle the processor. The solution, create a file /etc/default/powernowd with a single line in it:

    
    OPTIONS="-q -n"


Then issue the command /etc/init.d/powernowd restart and your computer will no longer throttle itself when transcoding and commercial flagging.  Enjoy the increased speed of transcoding and happy MythTVing.
