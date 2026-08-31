---
date: '2005-12-07T14:08:00-05:00'
old:
  layout: post
  oldcategories:
  - ubuntu
  status: published
  timestamp: 02:08 PM Wednesday, December 07, 2005 EST
  wordpress_id: '214'
oldtags:
- context
- fedora
- hdtv
- kernel
- linux
- mythtv
- pchdtv
- ubuntu
slug: context-switches
tags:
- kernel
- pchdtv
- fedora
- mythtv
- linux
- hdtv
- context
- ubuntu
title: Context Switches on Ubuntu
url: /weblog/2005/12/07/context-switches/
---

After trying a new motherboard and all that jazz to get my HDTV tuner card working
properly I decided to try a new operating system.  The thing that prompted this was
the notice that some people thought it might be a buffer related issue that was
causing some of the reception problems with the card.  I also noticed that my system
was consistently above 2000 context switches a second even when idle.  There was
usually around 1100 interrupts a second.  I compared this to my RHEL AS box which
was around 30/s when idle and running a lot more stuff.

So, today I set out to test this theory some.  I dropped in a FC4 x86_64 dvd and
installed it on a blank partition on my hard disk.  Sure enough, preliminary tests
indicate that I'm not loosing data and reception remains clear even when I'm under
heavy IO load, such as copying a file over.

So here's my theory.  Ubuntu uses a kernel that switches tasks more often to create
a more interactive computing experience.  However, for devices that produce large
amounts of streaming bandwidth, such as HDTV tuner cards (and to a lesser degree
SDTV tuner cards), the tasks switch too fast and the buffers never can be completely
emptied.  By switching to a higher minimum time slice the processor has enough time
to empty out the buffers.

Now, the question is this: is there a simple way to change the minimum time slice
for tasks under Ubuntu?  I remember seeing something where I could set the timer at
10, 100, or 1000 and seeing that it was set to 1000, but I can't find it in the
kernel configuration anymore.

Anyway, if you're having HDTV reception problems, I strongly suggest looking at this
as an issue.  I'm not 100% certain, but the preliminary tests are good.  Unfortunately,
I can't do the full battery yet because I don't have time and I don't even have
video working on MythTV box under Fedora.