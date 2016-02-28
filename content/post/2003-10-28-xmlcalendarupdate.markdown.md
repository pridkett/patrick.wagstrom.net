---
date: '2003-10-28T19:19:00-05:00'
old:
  layout: post
  oldcategories:
  - meta
  status: published
  timestamp: 07:19 PM Tuesday, October 28, 2003 EST
  wordpress_id: '119'
slug: xmlcalendarupdate
tags:
- meta
title: XMLCalendar Plugin Update
url: /weblog/2003/10/28/xmlcalendarupdate/
---

I realized that my first incarnation might have been a bit unrefined in some
respects.  This new version is much easier to run an XSLT parser over and
eliminates a lot of the redunancies.  Feel free to [fetch the new version](/projects/pyblosxom/plugins/xmlcalendar.py)
from the same spot.  I also got an email from [Wari Wahab](http://roughingit.subtlehints.net/pyblosxom/) (the author
of pyBlosxom) today suggesting that I make some of my other changes with the
browser specific flavors as a renderer.  I'm going to look into that this
weekend.  If that works then I'll probably just have some special code for
the HTML version of the page where it generates the XSLT then sends it through xsltproc serverside before
sending off to the older clients.
