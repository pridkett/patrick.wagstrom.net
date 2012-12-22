title: The 24 Hour Blog Challenge
timestamp: 11:16 AM Thursday, January 03, 2008 EST
status: published
slug: 24hrblogchallenge
tags:
- python
- weblog
- code
- 24hrblogchallenge
url: /weblog/2008/01/03/24hrblogchallenge/

layout: post
oldcategories:
- code
oldtags:
- 24hrblogchallenge
- code
- python
- weblog
wordpress_id: '262'

---

I've had a weblog of some sort since my early 1998 -- back before they were called weblogs.  Originally it was a set of PHP 3 scripts that talked to a MySQL database, pretty high-tech stuff for the era.  In 2001 I moved over to Movable Type because it was the blogging hotness at the time.  In 2003 after moving out of Chicago and seeing SixApart squander their opportunity due to asinine licensing terms (and the fact that Movable Type is written in Perl), I started using [PyBlosxom](http://pyblosxom.sf.net/), a dead simple system that relies on a set of files in the directory tree for posts.

Of course, I had to go an hack up PyBlosxom, giving it the ability to push XSLT transformations to the client, or doing them server side for readers with older browsers.  I also removed some of the silly stuff, like the ability to have it redo the content in 99 billion different formats.  The system has worked really well for me, creating a new post is as simple as opening up vi or Emacs and writing a text file.

But, this has it's drawbacks.  First, a complete directory crawl is required on every hit to the page.  With only a handful of posts, this isn't a big deal.  But I've got a couple of hundred posts and they're stored in subversion, so the crawl takes a while.  The posts then need to be sorted, and categorized.  Yeah, it's slow.  Second, It's all very hackey right now.  The fact that the XSLT transformations even remotely work is interesting, but I hate writing something and then seeing the [Yellow Screen of Death](http://en.wikipedia.org/wiki/Yellow_Screen_of_Death) in Firefox because I forgot to close a tag.

Thirdly, the comment system works, but it quite sub-par right now. Everything is stored in flat files, which makes comment management difficult.  Finally, I don't have the ability to save drafts, manage tags, or easily tweak a lot of things I'd love to do.  It's become painful.  PyBlosxom, it's not you, it's me.  I don't have time to do this stuff anymore.

What I do have time for is a 24 Hour Blog Challenge.  The goal of this will be to write a complete new piece of Weblog software in 24 hours -- and I'll do it while not neglecting any other responsibilities.  I should stress right now, I have no code written for this software, and will not until I return from the airport tomorrow and start writing.

Architecture wise, I have already decided that it will be a Python CGI system using an SQLite backend.  I'm not going to worry about WSGI or anything like that right now.  The system must be meet the following requirements at the end of 24 hours for it to be a success:
	
  * Import all previous stories -- It's no good if I lose all of my flat text files that I have laying around.  One of the first tasks will be to create an importer.
  * Non-Breakage of previous URLs -- I like the current URL scheme I have my for weblog and I would hate to have to create hundreds of [mod_rewrite](http://httpd.apache.org/docs/2.0/mod/mod_rewrite.html) redirects to keep everything working.
  * Command line import/export for stories -- I like being able to edit stories from the command line.  This new setup will just mean that I have to dump the story in and out with a script, nothing big and highly related to the first requirement.
  * Hierarchical classification of stories -- basically, continue to implement categories with improved category browsing.
  * Non-Hierarchical classification of stores -- make the tags on each story do something other than link to Technorati.
  * RSS Feeds -- if people can't read the weblog through a news reader, it's a web page, not a weblog.
  * User comments -- Likewise, all weblogs should have some way to easily interact with the author.  Comments must be enabled.

In addition to those features, here are requirements that should be completed, but the task won't be a failure if they're not.
	
  * User accounts -- not required for all comments, but could be used by users to customize the appearance of their comments, etc. Also makes management a bit easier.
  * Web based editing -- sometimes SSH just isn't an option and a web based system would be better.
  * Publish/Draft distinction -- Under PyBlosxom, stories are either published and public, or not.  There isn't a way to mark something as a draft, see how it will look, and then edit it some more.
  * OpenID support -- this is a long-shot, but OpenID seems nifty, I'd like to support it and set up some OpenID services for Wagstrom.net.
  * Integration with [PennAve](http://pennave.sf.net/) -- there's no reason why it shouldn't be easy for me to use photos in my collection in weblog posts.
  * WSGI support -- I hear that WSGI is the new hotness for hosting Python applications.  Supporting it should allow faster responses and all that.  This is a bigger thing that will most likely see me move [PennAve](http://pennave.sf.net/) to
a WSGI interface too.

I should stress that the purpose of this challenge is NOT to write the next Wordpress, MovableType, or whatever else the kids are using today.  The purpose is to see if I can create the system and to replace an aging and creaky system currently installed.  Anyway, wish me luck, I'll try to post as I go along tomorrow.
