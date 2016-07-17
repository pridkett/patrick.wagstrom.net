---
date: '2006-05-21T16:48:00-04:00'
old:
  layout: post
  oldcategories:
  - computer
  status: published
  timestamp: 04:48 PM Sunday, May 21, 2006 EDT
  wordpress_id: '111'
oldtags:
- OpenBSD
- server
- virtualization
- vmware
slug: virtualized-server
tags:
- computer
- OpenBSD
- virtualization
- vmware
- server
title: I'm now virtualized
url: /weblog/2006/05/21/virtualized-server/
---

To my loyal reader (or perhaps readers, who knows) -- you probably noticed some issued with the accessibility of this site over the past few days.  It seems like two different things were conspiring to take down my site.  The first is that my uplink connection has been a little flunky -- I've got a WRT54Gv1 that I use for my net access and that's been acting really strange.  The second is that my server, [scissors](http://scissors.wagstrom.net/) has been acting a bit flunky.  Before I go too far, a little description of the box is necessary.

The machine is a circa 1997 AMD K6-200 with 96MB of RAM and Quantum Fireball 4.3GB hard disk -- this was pretty hot stuff when I went to college in 1997.  Yes, that's right, it's my first computer from undergraduate.  The machine first started to have problems in the fall of 1999.  At the time I thought it was disk issues, so I bought a new disk.  That didn't fix the problems, in fact, I think I threw out at perfectly good 8GB disk at the time because of the issues.  Really, it was just problem with the IDE cables in the machine, but I digress. That year I was working more or less full time and going to school, so I had money to burn. I plunked down some cash for an Athlon 700 machine, and that machine became my backup server machine (replacting a Pentium 60).  This is also where the machine got the name scissors, for scissors.dtd.iit.edu.  I used some of the original parts in my newer machines, this left scissors with a black and with text only video card, and a couple of ISA ethernet cards (at least they're 3com).  Yup, 10mbps is the max ethernet rate on the machine.

This point was also the first time that I installed OpenBSD on it.  I believe it was OpenBSD version 2.5 or thereabouts - I actually paid for the CDs and have them laying around.  Since then, the machine has been upgraded to newer operating systems twice, first to OpenBSD 2.9, then again to OpenBSD 3.3.  It's served as a mail server, online game server, and most importantly my personal web server for the last few years.  At some point, probably in early 2003 the fan on the CPU died, but it didn't seem to affect performance, so I didn't care.  At some point later the fan on the power supply died -- once again it didn't seem to affect performance so I didn't care.  I now had a basically entirely silent machine.  Cool.  As an added bonus, according to my Kill-a-watt device, it sips power at a consumption of 33 watts.  This makes it nice and affordable to run.

However, the machine is now approaching it's ninth birthday.  It's had a good run -- but all good things must come to an end.  I've been getting rid of my old stuff and well scissors, it's time for you to go.  You've been replaced by the forward marching tide of technology. However, it's a real pain to reinstall web servers all the time.  My solution?  Virtualization.

Thanks to [VMWare Server](http://www.vmware.com/products/server/) and my copy of [VMWare Workstation](http://www.vmware.com/products/ws/), I've created a very nice little [OpenBSD](http://www.openbsd.org/) virtual machine.  Best of all, I've got all the services that previously were running between a couple of different servers consolidated onto this single box.  That means this virtual machine now acts as my trac, subversion, dav, and person web server.

Virtualization has quite a few benefits.  One of the biggest ones is that I can just copy the virtual machine from one physical computer to another.  This makes upgrades a breeze.  (As an aside, it also makes me wonder why I don't just install VMWare Server on my [MythTV](http://www.mythtv.org/) box in the living room and drop down to a single computer that is on 24/7.  Probably has something to do with the printer we never use I guess.)  Also, being virtualized, it let's me test other configuration changes easier.  I can take a snapshot of the server in workstation and try an upgrade or change in software with no risk to the live machine.  The VMWare Server console lets me manage everything from my laptop too.  Wow.

I know that someone out there will believe that I'm a sellout because VMWare is closed source.  Which is probably partially true.  However, I've been using VMWare since it first came out.  Back at [LEC Ltd](http://www.lecltd.com/), we used VMWare on the developer workstations to see how the web pages would look on different platforms.  Of course, we never thought about using it for server use -- but now it seems that's what the cool kids are doing.  An astute reader might wonder why I didn't choose [Xen](http://www.cl.cam.ac.uk/Research/SRG/netos/xen/) or [QEMU](http://fabrice.bellard.free.fr/qemu/).  With regards to Xen, I've heard that Theo considers Xen to be more of a toy, however he might be coming around to it (this was a year or more ago now).  I did notice that there is a [Summer of Code request to make OpenBSD a native Guest OS](http://archives.neohapsis.com/archives/openbsd/2006-05/0260.html).  That might be really interesting, but it's not here yet.  For QEMU, the big issue is that if you want native performance you need to the unfree accelerator program.  That, and it's not as feature rich as VMWare.  Given that I have extensive VMWare experience too, it seemed like this was the fastest way to get running again.

So what is all this saying?  Basically, if you're reading this weblog entry you're connected to my VMWare server instance, now called "[donkey](http://donkey.wagstrom.net/)" running OpenBSD 3.9.  Well, if this post is recent that's what happening.  In the future I should be able to upgrade pretty easy.  For now, the host machine for Donkey is a Pentium 3/900 with 640MB of RAM.  So far, so good.  I took extensive notes about the whole process and will be putting together a nice writeup soon.  If you've got questions about the process, feel free to email me in the mean time.