---
date: '2004-02-13T16:23:00-05:00'
old:
  layout: post
  oldcategories:
  - linux
  status: published
  timestamp: 04:23 PM Friday, February 13, 2004 EST
  wordpress_id: '182'
slug: fedorawinefix
tags:
- linux
title: Fixing Wine Under Fedora
url: /weblog/2004/02/13/fedorawinefix/
---

Fedora ships with a lot of nice security patches which make the system more
secure, at least in theory.  But the problem is that when running apps under
Wine, a lot of them will die because they have a hard coded location to start
their data segment at.  Luckily, [there is a
fix](http://www.winehq.org/hypermail/wine-devel/2004/01/0971.html).  First edit
your <span class="filename">/etc/sysconfig/prelink</span> to have the following line:

    PRELINK_OPTS="-m --no-exec-shield"

Then run the following two commands (they'll take a while):

    prelink -au
    prelink -a

You won't have exec shield support, but if you need access to some windows
programs through Wine this looks like the easiest way to get it.

