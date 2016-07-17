---
date: '2005-11-09T08:32:00-05:00'
old:
  layout: post
  oldcategories:
  - mythtv
  status: published
  timestamp: 08:32 AM Wednesday, November 09, 2005 EST
  wordpress_id: '161'
oldtags:
- dvb
- firewire
- mythtv
- pchdtv
- static
- tuner
slug: dvb-digital-noise
tags:
- pchdtv
- static
- mythtv
- tuner
- firewire
- dvb
title: DVB and Digital Static
url: /weblog/2005/11/09/dvb-digital-noise/
---

It kills me how I'm so close I can feel it, but it's completely out of my power to reach a 100% working system right now.  The reason?  I'm experiencing digital noise on my HDTV tuner card.  This REALLY blows. When the system is at low load, I have no problem recording HDTV programs, however, as the load increases, I see lots of noise show up on my system. Apparently, I'm not the only one having these problems, as [this thread from the MythTV users list](http://www.gossamer-threads.com/lists/mythtv/users/159591) shows.  I've also started a [discussion on the pcHDTV.com forums](http://pchdtv.com/forum/viewtopic.php?t=1077).

So what's a guy to do then?  I bought a system to make it HDTV compatible, but the HDTV is sucking it up.  I can get HDTV over the firewire, so I may just have to loose digital cable for right now.  Maybe this is the kick in the ass that I needed to create the mutually exclusive tuners.  Here's a brief explanation of what this would do.

Normally, I've got my WinTV PVR-250 hooked up to the cable box via svideo, and the channels are changed through firewire.  This lets me record all the channels out of the cable box in analog mode.  This card is also hooked up to the standard cable input and can tune the lower channels just fine.  In addition, I'm able to pull the firewire HDTV signal from the box onto my computer.  However, as you can now see, when I pull in the firewire HDTV signal, I'm going to end up changing channels on the WinTV PVR-250 that is getting it's signal over firewire.  So, I'd like to make it so only one of either the WinTV PVR-250 (with SVideo) and the Firewire cable input can be used at the same time.  Furthermore, it would be neat if as an extension, when the Firewire input was in use, it would automatically let my WinTV PVR-250 know that it should use the standard cable tuner input.  I wonder how hard this would be to hack together.