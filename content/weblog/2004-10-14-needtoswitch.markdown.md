---
date: '2004-10-14T13:17:00-04:00'
old:
  layout: post
  oldcategories:
  - priblog
  status: published
  timestamp: 01:17 PM Thursday, October 14, 2004 EDT
  wordpress_id: '287'
slug: needtoswitch
tags:
- priblog
title: More Reason To Switch
url: /weblog/2004/10/14/needtoswitch/
---

If I needed more reason to switch and finish coding PriBlog, I found out today
that the reason why some people can't see the images that I post is because I
styleize them with XSLT.  This causes an issue becuase the entries are not
styleized before encoding them in the RSS feed.  The result is that the RSS feed
which is supposed to contain HTML, contains raw XML.  This is probably a mistake
on my part, but it's frickin annoying none the less.






To make things worse, PyBlosxom seems to think that everything needs to end
in .html, which is not the case in my world.  Sigh.  Time to get coding this
weekend and get something preliminary going.  I'm not looking foward to fumbling
around with the various Atom standards.
