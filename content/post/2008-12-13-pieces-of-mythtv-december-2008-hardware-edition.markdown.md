---
date: '2008-12-13T13:52:00-05:00'
old:
  layout: post
  oldcategories:
  - mythtv
  status: published
  timestamp: 01:52 PM Saturday, December 13, 2008 EST
  wordpress_id: '525'
oldtags:
- drobo
- hardware
- hauppauge
- hdhomerun
- mythtv
slug: pieces-of-mythtv-december-2008-hardware-edition
tags:
- hardware
- hdhomerun
- mythtv
- hauppauge
- drobo
title: Pieces of MythTV (December 2008 Hardware Edition)
url: /weblog/2008/12/13/pieces-of-mythtv-december-2008-hardware-edition/
---

I'm five and half years into my journey with MythTV, and in that time I've managed to upgrade my system several times.  Back in 2006 I wrote a tutorial on [installing MythTV under Ubuntu with a pcHDTV card and a firewire tuner](http://patrick.wagstrom.net/tutorials/mythTV64/).  While some pieces of the machine remain the same, most of the pieces of hardware have changed pretty radically since then.

### The Case
I use an [Antec Overture 2](http://www.antec.com/usa/productDetails.php?lan=us&id=15730) desktop ATX case.  It's a fairly large case, but it fits nicely in my entertainment center.  Unfortunately, it vents out the sides and is a tight fit, so I had to do some modifications to give it better airflow.   I removed the back of my entertainment center where the box is (a virtual necessity given the number of cables hanging from it), and also cut a hole in the side leading from one compartment to another so the vent from the power supply would go somewhere.

<div class="image caption center">
    <img src="/weblog/media/2008/12/overtureii.jpg" alt="Antec Overture II Case">
    <p>Antec Overture II Case</p>
</div>

### The Processor
Athlon 64x2 4400+ on an MSI K8N-Neo4 Platinum motherboard - the processor is overclock slightly, so it runs at about the speed of a 5000+.  You can't get either of these anymore because it's a socket 939 setup.  It goes to show you don't need a beast of a Core i7 processor to run MythTV.  It has 2GB of Dual Channel DDR ram.  Certainly not anything overly spectacular, but pleanty for running a combination Front End/Backend MythTV setup.  While viewing 1080i HD the processor maxes out at about 60% utilization of a single core.


### Capture Devices
Analog cable is captured using a WinTV PVR-250 PCI card.  The card is getting pretty old, being the first part of MythTV I bought, but it still works like a champ.  I capture HD Cable using an [HD HomeRun](http://www.silicondust.com/products/hdhomerun).  I only have the most basic of cable, just enough for broadcast and a few other channels, so the HD HomeRun can capture everything.

<div class="image caption center">
    <img src="/weblog/media/2008/12/hdhomerun.jpg" alt="Silicon Dust HD HomeRun Networked HDTV Tuner">
    <p>Silicon Dust HD HomeRun Networked HDTV Tuner</p>
</div>

I can't stress how great the HD HomeRun is for capturing OTA or QAM unencrypted cable.  It's a small box, about the size of a few DVDs stacked, with two coax inputs, and an ethernet output.  These boxes have virtually zero configuration, and because it just speaks a simple network protocol, you don't need to worry about kernel changes or drivers.  The HD HomeRun just works.  Additionally, because it takes up no slots in the computer, you can go with a much smaller form factor system.  This works nicely for my eventual goal of putting everything on a Mac Mini or comparable tiny system.


### Storage
Inside of the Overture 2 I have two 320GB hard drives running as a mirrored pair.  This is where my database, photos, and music live.  For recordings I have a 1st generation [Drobo](http://www.drobo.com/) with 2x1GB and 2x320GB drives in it, providing about 1.6TB of protected space.  The Drobo is another great device that if you're serious about MythTV you should strongly consider getting.  Some folks will complain about the noise, but I've never noticed the Drobo make any notice.  Although, as a disclaimre, I have two fairly large fish tanks in my living room that produce significant noise.  HD actually doesn't need that much bandwidth and the Drobo can easily supply enough over USB for all of my needs.  As the limiting factor in the system is the USB bandwidth, you're safe going for slightly slower, quieter, and cooler drives like the [Western Digital GreenPower](http://www.wdc.com/en/products/products.asp?driveid=336) drives.

<div class="image caption center">
    <img src="/weblog/media/2008/12/drobo.jpg" alt="The DROBO USB Storage Robot">
    <p>The DROBO USB Storage Robot</p>
</div>

### Display
Inside the Overture 2 is an nVidia GeForce 6600LE.  It's fanless and really underpowered, I won't want to play games on it or anything like that, but at the time, it was a decent card to have, unfortunately, it doesn't support VDPAU, so at some point it will probably have to go.  This is connected via a DVI->HDMI cable to a Sharp Aquos 32" 720p display.  I realize the videophiles are laughing at me because it's a small TV, but the picture is quite good, blacks are black, no overscan, etc.  The display is driven at near-native resolution of 1366x768.  This means I lose a 1 pixel strip on each side.  I've never actually noticed that.


### Remote Control
Currently I use the remote control that came with the WinTV PVR-250 and the attached IR dongle.  It's been supported just as long as the WinTV card has and it works well enough.  There are some strange quirks where sometimes it seems to fall asleep and needs to be "woken up".  In addition, it only accepts IR codes from Hauppauge remotes.  The HD Homerun also has an IR receiver that is more generic and should work with most remotes.  I haven't gotten a chance to play with that yet, however.


### Future Upgrades
For my current cable signal, it seems as though this works quite nicely.  If I were to add components to my MythTV box in the future it would most likely be a [Hauppauge HD-PVR](http://www.hauppauge.com/site/products/data_hdpvr.html) once I get a better selection of cable channels.  At that point, there is a good chance I'll reture the PVR-250 card and switch to a much smaller case with everything external.