---
date: '2003-01-29T05:03:00-05:00'
old:
  layout: post
  oldcategories:
  - old
  status: published
  timestamp: 05:03 AM Wednesday, January 29, 2003 EST
  wordpress_id: '83'
slug: gentooonsparc
tags:
- old
title: Gentoo on Sparc
url: /weblog/2003/01/29/gentooonsparc/
---

So rather than utilize a junk windows PC for my computer for research, I have been allocated a SunBlade 100, not a bad computer at all.  The problem is that I need USB network device driver support for it.  Solaris doesn't cut it.  So I figured that I would install Linux on it.  The natural choice, at least for me, was Gentoo.  It seems like a nice enough distribution.  I like the entirely from source totally-up-to-date aspect of it.  But it doesn't seem to be going that well.

First I had to fight with the install program.  I had some big time problems with mounting the proc file system.  I think I have it now, but I'm still not all that sure.  Then I had to wait while it compiled everything.  I can handle all of that.  Then I installed SILO but must have horked it, because it didn't work.  The bootable CD saved me.  Then I realized that I hadn't installed the /usr to the partition that /usr was supossed to be on.  This killed me.  It horked both my /usr and my / partitions.  So it's back to square one with Gentoo on my blade.  Oh well...keep on trucking...
