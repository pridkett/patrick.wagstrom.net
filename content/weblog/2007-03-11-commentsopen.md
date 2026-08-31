---
date: '2007-03-11T21:50:00-04:00'
old:
  layout: post
  oldcategories:
  - meta
  status: published
  timestamp: 09:50 PM Sunday, March 11, 2007 EDT
  wordpress_id: '121'
oldtags:
- comments
- hacks
- pyblosxom
- weblog
slug: commentsopen
tags:
- pyblosxom
- meta
- weblog
- comments
- hacks
title: Comments are Now Open
url: /weblog/2007/03/11/commentsopen/
---

In the dark old days of the internet, I used to run a weblog using a few ad hoc PHP scripts.  They broke a lot and generally weren't well maintained.  Somtime later I started to use [Movable Type](http://www.movabletype.org/). After all, it was 2001, and that was all the rage back then.  However, as a devotee of the "Dump Perl for the good of all humanity" movement, I wan't too keen about running a set of Perl CGI scripts on my webserver.  Don't get me wrong, Movable Type was great and all, but it was still Perl.  Which meant it was nigh impossible to hack on.  Sometime later, with the release of Movable Type version 3, the license changed to something that was decidely un-free and un-cool.  I don't remember the details, but I just remember not particularly liking the change.

In late summer of 2003 I moved to Pittsburgh, and for a few months, my entire website went dark.  Then it came back online using some hokey methods to make it accessible on my Verizon DSL line.  I began to search for a new weblog system that met most of my requirements.  Namely, that it was written in Python, because that was my language du jour at the time (and for the most part, still is).  I found lots of different options, but none seemed really complete.  I finally settled on [PyBlosxom](http://pyblosxom.sourceforge.net/).  It was completely file based, so it seemed pretty simple to setup.  Almost everything was done via plugins, which also was quite cool.  It was a pretty minimalistic weblog system.  For the most part it worked for me.

As time went on, I added some new features to PyBlosxom, and saw the software move into the life support stage of development.  The original architecture was pretty cool, but it wasn't quite structured the right way for all the stuff I wanted to do.  I undertook a painful process to augment the infrastructure of Pyblosxom to give it some XML/XSLT rendering framework, and produce what you see today.  I find it marginally a pain to administer, but it works for the most part.  Anyway, since switching to PyBlosxom, I've lacked the ability to allow for reader comments on the page.  I'm not sure why, probably because I was getting lots of spam on my Movable Type weblog back in the day.  However, a lot has changed with  weblogs in the three and a half years that I've used PyBlosxom, and the time has come to hack together more stuff into my PyBlosxom implementation.  That's right, effective today, commenting exists once again.  Halleluja!

The commenting system isn't perfect.  It basically translates every message into plain text, replacing carriage returns with &lt;br&gt; tags, but it seems to work well enough.  Consider it to be another ball of duct tape on top of the mess of scripts that holds this website together.  Anyway, so feel free to try and leave some comments.  If people really hammer the system, I'll probably be forced to modify the script for more anti-spam stuff and what not.  For right now, I'm counting on the fact that the system is unique to keep the spambots away. And with that, let the conversations (or lack thereof) begin.