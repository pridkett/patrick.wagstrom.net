---
date: '2006-07-13T16:08:00-04:00'
old:
  layout: post
  oldcategories:
  - gallery
  status: published
  timestamp: 04:08 PM Thursday, July 13, 2006 EDT
  wordpress_id: '273'
oldtags:
- cherrypy
- f-spot
- pennave
- photos
- python
- sqlobject
slug: pennave-is-up
tags:
- sqlobject
- photos
- cherrypy
- f-spot
- python
- gallery
- pennave
title: PennAve is Up!
url: /weblog/2006/07/13/pennave-is-up/
---

Today, more than [two years after I started work on a gallery program](http://patrick.wagstrom.net/weblog/code/gallery/start.xml), I finally have something that is workable and presentable.  No, I did not spend the last two years working on this software.  In fact, it's been almost entirely written since I got back from Honduras and realized that I had 900 or so photos that I would like to share.

The original [PennAve](http://pennave.sf.net/) was python based and used [the Python Imaging Library](http://www.pythonware.com/products/pil/) for resizing the elements.  It also had some cool features like showing just a subsection of a picture, dynamic resizing to any size, and that sort of stuff.  Eventually it was supposed to go all multiuser and what not.  Then [Flickr](http://www.flickr.com/) exploded and it didn't seem like such a novel idea anymore.

So I had to think about a new way to do stuff.  I started using [f-spot](http://www.f-spot.org/) to manage my photos.  I like the fact it allows me to create multiple versions of a photo with ease and the great integration of tagging into it.  It makes a nice slide show too.  From F-Spot I can export the data to a whole bunch of different systems, none of which I was a real fan of.  I wanted something that would let me use the F-Spot data without needing to use some other hokey system.  I figured this would bring us one step closer to world dominance.  Then I revisited [Miguel de Icaza's writing about the Web Desktop](http://tirania.org/blog/archive/2005/Nov-27-1.html) and figured this would be a cool starting point.

Unfortunately, or perhaps fortunately, it's not quite what Miguel envisioned. He talked about going all out and making it as an integrated part of the desktop.  Of course, he envisioned using [Mono libraries](http://www.mono-project.com/).  While I don't have a problem with C#, I realize that my server runs [OpenBSD](http://www.openbsd.org/) and I'm not eager to get Mono on there.  Also, there is no desktop on my server, so integrating it into F-spot was also a no go. The solution?  Whip up a little fun with [CherryPy](http://www.cherrypy.org/), [SQLObject](http://www.sqlobject.org/), and [PIL](http://www.pythonware.com/products/pil/).  A bit more fun with [libXML](http://www.libxml.org/) and things seemed quite nice.  So now, I present for folks to take a gander at, [my PennAve demo site](http://patrick.wagstrom.net/gallery/).  If this seems to continue working well, then I'll put the source up for a nice release sometime soon.  In the mean time, leave me some feedback on it.  If you'd like to just browse two major topics, look at [Bellefield's Honduras mission photos](http://patrick.wagstrom.net/gallery/tags/15) and photos from [our Niagara Falls anniversary trip](http://patrick.wagstrom.net/gallery/tags/667).