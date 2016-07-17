---
date: '2005-09-28T16:09:00-04:00'
old:
  layout: post
  oldcategories:
  - mythtv
  status: published
  timestamp: 04:09 PM Wednesday, September 28, 2005 EDT
  wordpress_id: '163'
oldtags:
- arrrgh!
- comcast
- hdtv
- linux
- mythtv
- pchdtv
slug: comcast-says-screw-you
tags:
- hdtv
- pchdtv
- comcast
- mythtv
- linux
- arrrgh!
title: Comcast Says Screw You!
url: /weblog/2005/09/28/comcast-says-screw-you/
---

The title sums it up quite nicely.  Instead of making it easy for me to watch HDTV, they're making it quite difficult.  I called them last week to inquire about HDTV support on cable.  I was told that I needed to get a cable box, that would run me $5.99 a month.  For another few bucks I could get the digital classic package.  Not too bad I guess.  Anyway, today the guy arrived.  Was a little shocked to see that I didn't have a box but he had one in his truck, a Motorola DCT 6200 to be exact.  This is the nicer one with firewire outputs.

Anyway, we hooked it up pretty quickly and I was getting the stations.  The problem is that I didn't have any menu support, so I had no guide information. Furthermore, I couldn't actually get HDTV to display on my DVI output.  That blew.  Instead, I got a nice message saying that it couldn't authenticate me.  What the fuck?  I can barely understand this message, I could hardly imagine what would happen to grandma reading it.

<div class="image caption center">
    <img src="/weblog/media/2005/09/hdcpMonitor1.jpg" alt="It says "please", but I dont want to">
    <p>It says "please", but I dont want to</p>
</div>

<div class="image caption center">
    <img src="/weblog/media/2005/09/hdcpMonitor2.jpg" alt="Apparently the setup screen is so secret I can't see that either.">
    <p>Apparently the setup screen is so secret I can't see that either.</p>
</div>

What was happening is that box was trying to authenticate using [HDCP](http://en.wikipedia.org/wiki/HDCP) to my monitor which doesn't support it.  It's not like I can copy the digital signal from the monitor, but I digress.  Basically, when the DVI is plugged in or powered on it waits a few seconds to get a handshake back from the monitor saying that it won't let you copy stuff.  If it doesn't get it, it blacks out.  So much for fair use.  To make things worse, it appeared that I could only get the display when using the DVI, so I had to any settings or browsing for video on demand in the few seconds before the cable box decided I couldn't see that anymore.  What the hell?

After some digging around, I found the [DCT 6200 User Guide](http://broadband.motorola.com/dvr/downloads/DCT6200-08_UserGuide.pdf) on Motorola's site.  It still didn't provide any information about how to get to the uber setup screen that the tech who installed the box got to, but it did tell me that if it was set up to output HDTV then it would not be able to overlay the graphics on the SVideo or composite outputs.  Wow, what crappy American engineering. There is hope, you can get to the setup by turning the box off, then hitting the menu key when the box is off.  This will let you do some menu stuff using the LED displays on the front of the cable box.  Basically, set all outputs to 480i and you'll be able to get your display back.

So now I decided to play with HDTV.  It turns out that I can use the box to tune HDTV, but it will downgrade the coax output to SD.  Bullshit.   So, I tried hooking up my cable line directly to my [pcHDTV](http://www.pchdtv.com/) card.  Running some fun scanning software shows me that indeed I'm getting lots of signals.  221 of them to be exact.  That can't be right I thought.  Running the file command on a single dump didn't prove helpful, it just said data.  Mplayer was choking on the first few.  Still, it seemed odd.  So, I decided to write a little script to scan all 221 channels.  Voila, I've got some HDTV channels coming in.  Fear Judge Hatchett in HD.

Now I'm left wondering if I need the box at all.  I can probably just cancel it because it doesn't work as advertised.  But then I would loose Sci-Fi, basically the only good new channel I get.  We'll have to see.  I may also decide to pick up another tuner card and a firewire cable to control the box and just record programs from that.  Could be a lot of fun.  More updates later.

**Update:** One of my helpful readers pointed me to the [DVI Magic](http://www.spatz-tech.de/spatz/dvi_magic.htm) device, which is sold as an HDCP compatible DVI amplifier.  Looks very interesting, but a but too expensive for me at 399 euro's.  Pity.