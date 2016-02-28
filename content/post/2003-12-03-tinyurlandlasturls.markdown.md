---
date: '2003-12-03T09:59:00-05:00'
old:
  layout: post
  oldcategories:
  - pimpbot
  status: published
  timestamp: 09:59 AM Wednesday, December 03, 2003 EST
  wordpress_id: '303'
slug: tinyurlandlasturls
tags:
- pimpbot
title: Tinyurl and LastURLs for PimpBot
url: /weblog/2003/12/03/tinyurlandlasturls/
---

I wrote a couple of new plugins for PimpBot last night.  The first is a module
that will take any URL that is posted in the channel over a certain length
and submit it to [TinyURL](http://tinyurl.com/) to get a tiny
version of the URL.  The result usually comes shortly after a message as
the bot has got to submit the request to TinyURL.  I should add some timeout
functionality to it in case TinyURL goes down so the bot doesn't miss stuff.






The second collects all the URLs posted in the channel and allows you to query
them.  Normally this is done by typing !urls, at
which point the most recent 10 urls will be returned.  You can also specify a
search string, like !urls sportsbybrooks which will
return the 10 most recent urls that contain a specific string in them.
