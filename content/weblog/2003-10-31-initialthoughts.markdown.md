---
date: '2003-10-31T00:09:00-05:00'
old:
  layout: post
  oldcategories:
  - mod_excesslt
  status: published
  timestamp: 12:09 AM Friday, October 31, 2003 EST
  wordpress_id: '308'
slug: initialthoughts
tags:
- mod_excesslt
title: Initial thoughts on a new Apache module
url: /weblog/2003/10/31/initialthoughts/
---

So now that I've got my blog automagically rendering XML into HTML through XSLT
for browsers that can't hack it, I'd like to extend that to my entire web
server.  This will take a little bit more work.  First I'll describe the
general concept:

1. User makes a request for a given page such as index.xml or foo.php

2. Post construction of the page (so this will work with PHP and what not) the
module checks the header on the page, if it is text/xml then we proceed to the
next step, otherwise return data unprocessed

3. Check to see if browser is one that can handle getting an XML stream
returned to it, such as [Firebird](http://www.mozilla.org/products/firebird/).
If it is, then return the stream unprocessed

4. We should only reach this point if the content is text/xml and the browser
does not have and XSLT engine.  If this is the case, dig into the XML file and
see if it supposed to have an associated stylesheet to go along with it.

5. If there is no associated XSLT sheet, return the data as straight XML.  This
way it still is possible to send back things like RSS feeds.

6. Finally, run the XML file and XSLT sheet through an XSLT engine and return
the output to the client.

There are a few other packages out there that claim to do some XSLT
transformations for Apache, among them are
[modxslt](http://modxslt.sourceforge.net/) and
[murka](http://murka.sourceforge.net/).  It appears that modxslt has been dead
since 2001, which make me wonder how well it will work with newer
version of Apache.  Murka seems to be fairly up to date, but I don't like how
it doesn't allow the client the pleasure of doing the XSLT transformation.  I
say pleasure because allowing the client to do the rendering opens up some neat
opportunities for new ways of accessing the site.  I'm also not a fan of how it
creates so many virtual URLs that tend to make stuff confusing for
administration.  I would just like the request to always be for
foo.xml rather than all the other extensions.

As far as actually implementing this, I don't know jack about how to write a
module for Apache 2 (I've got a book on Apache 1).  Also, it's been a very long
time since I've written anything in C.  I was thinking that it might be neat to
work with [modpython](http://www.modpython.org/), but then I'd need
to install modpython, which I'm too lazy to do.  Well, that and I'm also not
sure if it links as deep into Apache as modperl does.  So with all that being
said, I think that I'm going to make a shot doing it in C.  It will be a good
exercise.  I'll keep updating this section of the blog as I go.

