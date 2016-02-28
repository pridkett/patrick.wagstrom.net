---
date: '2007-09-27T18:20:00-04:00'
old:
  layout: post
  oldcategories:
  - code
  status: published
  timestamp: 06:20 PM Thursday, September 27, 2007 EDT
  wordpress_id: '322'
oldtags:
- code
- git
- grandr
- xrandr
slug: grandr-public-git-repo
tags:
- code
- grandr
- git
- xrandr
title: Grandr Public Git Repository now Open
url: /weblog/2007/09/27/grandr-public-git-repo/
---

Yesterday in my post about [things to love in Ubunty Gutsy](/weblog/linux/what-you-should-love-about-gutsy.xml), I talked a little bit about how great it was to have Xrandr 1.2 finally available on my Laptop.  There's a little graphical utility to setup the screens under Xrandr 1.2 called [grandr](http://gitweb.freedesktop.org/?p=xorg/app/grandr.git).  However, it had some critical flaws, mainly it crashed on my machine and didn't remember the layout of the screens at all.  This made it less than ideal.

Luckily, after a little bit of hacking, I've managed to improve the program to the point where it's usable and even has a bit of remembering where the displays are currently located.  It's not perfect by any means, but it works well enough for me.  If you're interested in pulling down my latest changes you can do that using:


    git clone http://patrick.wagstrom.net/git/grandr.git


I'm still pretty new to this whole [git](http://git.or.cz) thing, so I may have mucked something up, but I'm pretty sure that will get you my master trunk.  If you have questions, feel free to email me.