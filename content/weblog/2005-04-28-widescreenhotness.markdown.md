---
date: '2005-04-28T09:02:00-04:00'
old:
  layout: post
  oldcategories:
  - mythtv
  status: published
  timestamp: 09:02 AM Thursday, April 28, 2005 EDT
  wordpress_id: '157'
oldtags:
- 2005fpw
- dell
- hotness
- mythtv
slug: widescreenhotness
tags:
- hotness
- dell
- mythtv
- 2005fpw
title: Widescreen MythTV Hotness
url: /weblog/2005/04/28/widescreenhotness/
---

In addition to all of the [pcHDTV cards](/weblog/2005/04/25/wplugpchdtv4) I bought last week, I also picked up a shiny new [Dell 2005 FPW](http://accessories.us.dell.com/sna/ProductDetail.aspx?TabPage=overview&sku=320-4111&category_id=4009&c=us&l=en&cs=19). It's a beautiful 1600x1050 20.1"
widescreen LCD.   It's also successfully replaced both the monitor and TV that
we had sitting on our entertainment center in the living room.   It took a
little bit of Googling to figure out to get my video card to like the monitor,
but it turns out my trusty MGA G400 works like a charm.
The main thing to remember is that the monitor only handles a 60Hz refresh.
Unlike a regular CRT where this would be unbearable, it's not really noticeable
on an LCD.

In short, here's the lines you need to dump into your `/etc/X11/XF86Config-4` or `/etc/X11/Xorg.conf`.  I
don't claim to have discovered these, but they do seem to work for me.

    Section "Modes"
         Identifier "16:10"
         ModeLine "1680x1050" 146.2 1680 1960 2136 2240 1050 1080 1086 1089
         -hsync +vsync
    EndSection

    Section "Monitor"
         Identifier "dell"
         ModelName "2005FP Widescreen"
         UseModes "16:10"
         HorizSync 30-83
         VertRefresh 56-75
         Option "DPMS"
    EndSection

    Section "Screen"
         Identifier "Screen 1"
         Device "Matrox Graphics, Inc. MGA G400 AGP"
         Monitor "dell"
         DefaultDepth 24

         Subsection "Display"
             Depth 24
             Modes "1680x1050" "1280x1024" "1024x768" "800x600"
             ViewPort 0 0
          EndSubsection
    EndSection

    Section "ServerLayout"
            Identifier      "Default Layout"
            Screen          "Screen 1"
            InputDevice     "Generic Keyboard"
            InputDevice     "Configured Mouse"
            InputDevice     "Generic Mouse"
    EndSection

This monitor is quite nice because in addition to taking VGA and DVI input, it
also takes SVIDEO and composite input.  Thus, in addition to having the Myth
box plugged in, I've also got my DVD player plugged into the SVIDEO and and
the VCR plugged into the composite input.  I was able to once again get it
hooked up to DPMS so my remote turns the monitor off, but I don't know of way
to force it to change inputs without getting off my butt.  It's got a USB hub
on it, would it have been so hard to make it controllable over the USB port?
And yes, I've already looked into this, the monitor shows up strictly as a
USB hub, not as anything else.

So, without further ado, some pictures of my new MythTV hotness.

<div class="image caption center">
    <img src="/weblog/media/2005/04/mythTVSetup.jpg" alt="The fullll entertainment center, now with extra empty space">
    <p>The fullll entertainment center, now with extra empty space</p>
</div>

<div class="image caption center">
    <img src="/weblog/media/2005/04/dell2005fpw.jpg" alt="Closer shot of the Dell 2005FPW monitor">
    <p>Closer shot of the Dell 2005FPW monitor</p>
</div>

<div class="image caption center">
    <img src="/weblog/media/2005/04/mythTVBox.jpg" alt="The actual MythTV box, a six year old Athlon 700">
    <p>The actual MythTV box, a six year old Athlon 700</p>
</div>

The first picture shows the complete entertainment center setup.  It still is a bet
messy, I really should hide some of the remotes and keyboard and mouse.  I so
rarely use them anyway.  One of these days we're going to get a better set of
speakers too, but I think I'll upgrade the box first.

The next pic shows the monitor playing the full frame version of [Shrek](http://www.imdb.com/title/tt0126029/).  My DVD player doesn't know when it's
outputting widescreen, so that makes things a little weird.  It's a first
generation DVD player from about 1998 or so.  But it does support component
video and digital audio.  Not like our cruddy little stereo could support it
right now anyway.  Fortunately, MythTV automagically detects the 16:10 aspect
ratio of the monitor and scales the output properly.  It also provides a
variety of zoom modes which is very useful for watching HD letterboxed programs
captured over NTSC.  Even for standard full-frame using a 4:3 zoom mode seems to
work nicely and capture most of the screen (only tested on Family Guy and The
Simpsons so far).

The final shot shows the actual computer that runs my MythTV box.  It's my
computer from undergrad, complete with stickers from the dot-com bust on it.  A 700MHz Athlon with 768MB of ram and 245G of
hard disk loaded with [Ubuntu](http://www.ubuntulinux.com/) 4.10 (Warty Warthog).  It runs well enough, but lately has been hiccuping a lot.  I'm not
sure why.  Video capture is done via a [Hauppauge WinTV PVR-250](http://www.hauppauge.com/pages/products/data_250.html) and now a [pcHDTV HD 3000](http://www.pchdtv.com/hd_3000.html).  I can't actually play back the
HDTV on this system yet, so if I want to watch it, I need to transcode, which
is really slow.  I've been looking at getting a faster system, Intel machines
seem to do better at the task, but the [power consumption is insane](http://www.techreport.com/onearticle.x/7417) not to mention the energy lost as
heat off the chip.  This means I'll probably wait a bit longer (end of summer
or so) and then pick up a nice Athlon 64 with the Winchester or Venice core
to save on some power consumption.  Also, atop the box you can see my second
LinkSys WRT54G.  This is loaded with [DD-WRT firmware](http://dd-wrt.com/) to provide wireless bridging and range extension to my cable modem in
the study upstairs.