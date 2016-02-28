---
date: '2004-05-26T01:23:00-04:00'
old:
  layout: post
  oldcategories:
  - gallery
  status: published
  timestamp: 01:23 AM Wednesday, May 26, 2004 EDT
  wordpress_id: '274'
slug: gettinggoing
tags:
- gallery
title: Update on Gallery Software
url: /weblog/2004/05/26/gettinggoing/
---

This is just a quick update on my gallery software.  It's coming along quite nicely, to be honest,
I think that it's going better than I expected.  Who knows, I might actually finish this.  Or not.
Anyway, the system now spits out an XML file that is translated through an XSLT script.  The XML
file is really just an RDF file that contains all of the fun information about the creator, rights,
etc.  In addition, it also contains information about defined regions in the image.  These defined
regions can have annotations, just like with [fotonotes](http://fotonotes.net/).  I
haven't yet added the ability to allow people to create regions, but that is coming soon enough.






I think the next big question is whether to do the system with a database backend or a file based
backend.  I already have a database set up, so I'm leaning in that direction, although that would
mean yet another dependency that would keep people from ever actually using the software.  I'm not
sure what I think about that.  XML files for storing the information, on the other hand, make it easy
to install (just like [gallery](http://gallery.sf.net/)) and move to a new system.  In
general, average users tend to stay away from databases, and for good reason.






Thus I am at an impasse.  Either make the system REALLY powerful by using a database backend, or
make it so anyone can use the system by using a flat file backend.  Or, I can spend 10 times the
amount of time and design an architecture that lets me use both.






Oh yeah, caching of images is now done, but it doesn't check timestamps yet.   The whole timestamp
checking thing shouldn't be that big of a deal.  Adding in the image caching sped things up a whole
lot, but it also leaves dozens of files sitting around my /tmp directory.
