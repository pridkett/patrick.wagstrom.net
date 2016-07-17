---
date: '2004-05-31T15:35:00-04:00'
old:
  layout: post
  oldcategories:
  - linux
  status: published
  timestamp: 03:35 PM Monday, May 31, 2004 EDT
  wordpress_id: '195'
slug: wrt54gfirmwareupgrade
tags:
- linux
title: Upgraded My WRT54G Firmware With Sveasoft
url: /weblog/2004/05/31/wrt54gfirmwareupgrade/
---

I got ambitious yesterday and decided to upgrade the firmware on my WRT54G
wireless router.  While there are a lot of choices, including
[EWRT](http://www.portless.net/ewrt/), [OpenWRT](http://openwrt.ksilebo.net/),
I decided to use the semi-open [Sveasoft](http://www.sveasoft.com/) firmware.
We'll it is open, at least the release that I used, which is the slightly older
Samadhi release.  So, after first using the Ping.asp exploit to turn boot_wait
on, I then uploaded the firmware.  It seemd as though everything went okay, the
router continued to function and give out IP addresses.  However, there was a
big hitch, I couldn't get to the internet from my computers behind it.  It
turns out I had to reset the configuration of the device.  After this
everything worked like a charm.  I've got SSH running on the box and it now
hands out static IP addresses via DHCP, these addresses also get a hostname
too.  I haven't gotten around to mucking with WonderShaper yet because most of
the time I don't come close to fully utilizing my bandwidth.

I've given some thought to running it as an open access point for everyone, but
this would mean removing my WEP encryption (yes, it's a joke for a good hacker,
I know), which is not going to happen any time soon.  I'm eagerly awaiting the
ability to have the box grab an IPv6 address and do all that fun stuff.  Which
would be very cool.  For right now, I'll have to settle with leaving a few
ports open to get behind the firewall to my server.

