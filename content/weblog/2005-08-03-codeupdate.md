---
date: '2005-08-03T23:20:00-04:00'
old:
  layout: post
  oldcategories:
  - code
  status: published
  timestamp: 11:20 PM Wednesday, August 03, 2005 EDT
  wordpress_id: '306'
oldtags:
- f-spot
- gnome
- hacking
- mythtv
- research
slug: codeupdate
tags:
- f-spot
- code
- gnome
- mythtv
- hacking
- research
title: Random bits of Code Hacking
url: /weblog/2005/08/03/codeupdate/
---

So it's been a while since I wrote what I've been hacking away on.  The biggest
thing is that I've been trying to add license support to
[F-spot](http://www.gnome.org/projects/f-spot/).  It's not that
difficult to do, but the architecture doesn't support changing the schema
all that much.  The thought is that there will be another category of
things like tags, just licenses.  Right now each photo can have a single
license associated with it.

Each of the licenses then has a set of properties that are basically taken
from the [Creative Commons](http://www.creatvecommons.org/) licenses.
In the future, this will allow you to select only those photos that allow
commercial use, or something like that.  Maybe when we combie it with the
Flickr export, your photos will automagically keep their licenses.  All sorts
of neato possibilities.  I just need to find to hack on it some more.  Research
is burying me.

On the research front, I've been hacking away at my scripts to automatically
build social networks for OSS projects.  It's all very cool.   Give it a URL
and it just goes out and builds lots of useful information from these networks.
I've been integrating information from a copy of the
[GNOME CVS](http://www.gnome.org/) repository that I recently got.
GNOME is a MASSIVE project.  There's about 500,000 different files in the
complete CVS repository.  That's a lot of analysis.  It's even bogging down
our dual opteron server.  Yikes.

On the home front, I've been exploring how to get nice DVDs burned from movies
that I've recorded with MythTV.  Unfortunately, my 200GB hard disk is nearly
full and I need to rememdy that soon.  Right now I've been deleting crappy
stuff like [King Ralph](http://www.imdb.com/title/tt0102216/),
but I've got a finite number of crappy movies.  It's probably more practical
to start buring TV shows to DVD.  But I need to burn a lot of Simpsons episodes
to DVD to start freeing up space.  Of course, the other option is to wait
and get a bigger hard drive.  I think I'm a little biased.  The last one I
picked up for $35 (after $60 in rebates) and it was 200GB.  I don't want to get
anything that's a worse deal.  I saw that Hitachi just came out with 500GB SATA
drives.  Maybe this is the excuse I've needed to pick an SATA controller.

Of course, I might be able to skew this to say that I need a new MythTV box.
After all, I've got a [pcHDTV](http://www.pchdtv.com/) card in there
that can't even be used because the computer is too slow (and I haven't put up
an antenna yet).  Also, the system randomly gets overloaded and crashes.  If I
were to purchse a nice AMD Athlon 64x2 4800 that would never happen.  Of course,
I won't be able to afford one of those until they're in the $200 price range.
Silly house sucking up all of our money.  What do we need capital for?