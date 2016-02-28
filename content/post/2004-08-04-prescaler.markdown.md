---
date: '2004-08-04T17:20:00-04:00'
old:
  layout: post
  oldcategories:
  - gallery
  status: published
  timestamp: 05:20 PM Wednesday, August 04, 2004 EDT
  wordpress_id: '267'
slug: prescaler
tags:
- gallery
title: The Prescaler Has Landed
url: /weblog/2004/08/04/prescaler/
---

I went through and wrote a prescaler program for
[PennAve](http://pennave.sf.net/) yesterday and perfected it today.
This means that if you run PennAve on a very slow computer, you don't have
to worry about the overhead of the CGI call every time, instead it uses
the precached files.  This makes the program run MUCH faster, but also hides
a lot of the coolness that was originally written into PennAve.






I also took the time to make it so little snap shots of the previous and
next image were shown when you're lookings at individual images.  I don't
quite have the ability to jump around yet, but it should be coming.  That might
require a bit more work.  We'll have to see.






The code is still holding up quite well, but it's showing some signs of where
I hacked too many things together.  This is especially true with some of the
initial code to handle paths.  I'm slowly fixing all those bugs and making it
handle everything to proper way.






As far as a demo goes, I'll probably get something going soon.  I've got a
bunch of wedding photos that I'd like to put online but just haven't had a
chance to yet.  I'm also still waiting for a few photo CDs from the underwater
cameras.  That should be a crap shoot in terms of quality.  When I get all
those, I'll use PennAve as the default gallery.  This means that I'll also have
to land the internal XSLT engine for bad browsers.
