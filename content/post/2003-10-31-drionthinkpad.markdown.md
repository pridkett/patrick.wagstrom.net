---
date: '2003-10-31T00:23:00-05:00'
old:
  layout: post
  oldcategories:
  - thinkpad
  status: published
  timestamp: 12:23 AM Friday, October 31, 2003 EST
  wordpress_id: '177'
slug: drionthinkpad
tags:
- thinkpad
title: Enabling DRI on a Thinkpad A31
url: /weblog/2003/10/31/drionthinkpad/
---

As part of my [program here](http://www.casos.ece.cmu.edu/) I've
got an IBM Thinkpad A31.  In general it's a pretty nice little system, it's
got a few issues that I'll try to document here and how I've managed to get
around them in hopes that this information can help someone else out.






One of the most annoying things is what happened when I upgraded the kernel.
I currently run [RedHat 9](http://www.redhat.com/) and it works
quite well.  Then I tried to upgrade the kernel from 2.4.20 to 2.4.22 because
of the improvement in the wireless drivers associated with the system.
However, this ended up killing my DRI (3d acceleration).  The reason is
because my DRI was no longer the right version (1.3 vs 1.1).  The solution,
recompile the DRI drivers and reinstall them over the ones that shipped with
the kernel.






The first step is to go and download the driver source from [Alan H's](http://www.xfree86.org/~alanh/) website.  Then unpack and
compile them using the command make -f
Makefile.linux.  The final step is to
copy radeon.o to
/lib/modules/2.4.22/kernel/drivers/char/drm/radeon.o.
Then either reboot or log out of X completely and reload the kernel module.
Now when you run "glxgears" you should get a good framerate (~ 1000fps).






If this still doesn't work, for instance glxgears
reports back LibGL: init failed then you should
make sure to set LIBGL_DEBUG=verbose and try running
the command again.  This can provide more information to help you debug the
problem.
