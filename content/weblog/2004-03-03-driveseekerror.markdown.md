---
date: '2004-03-03T21:51:00-05:00'
old:
  layout: post
  oldcategories:
  - linux
  status: published
  timestamp: 09:51 PM Wednesday, March 03, 2004 EST
  wordpress_id: '185'
slug: driveseekerror
tags:
- linux
title: Fixing Some Longstanding Problems
url: /weblog/2004/03/03/driveseekerror/
---

I finally got around to fixing some long standing problems with my computer
today.  First among them was the problem that I had been having with the
following errors for the last four or five years:

    Mar 03 08:21:35 dreams kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
    Mar 03 08:21:35 dreams kernel: hdc: dma_intr: error=0x84 { DriveStatusError BadCRC }

I had this problem since my K6-200.  It eventually caused me to buy a new hard
disk for that computer and set up some funky raid stuff because I thought I was
loosing data.  Turns out I probably wasn't.  Anyway, this problem is the result
of a bad IDE cable.  So it's a hardware problem.  I probably just moved the IDE
cable when I switched from one computer to another.  I found out that I had a
spare 80 pin IDE (as opposed to that 40 pin IDE cable) so I plopped it in and
it works like a charm.  Also of interest is the nice speedup that I got from
it.

Also managed to go through and make it so my computer boots better.  It had
been a little flunk since upgrading the bios this past weekend.  All that was
in an attempt to get my computer to sleep better.  Which won't work because I
don't have a wake on lan cable.  So, if you've got one that you want to give to
me or sell for cheap, let me know.  I'd be thankful as it would cut down my
power bill if I could shutdown the PC when I wasn't using it.

