---
date: '2004-07-01T10:37:00-04:00'
old:
  layout: post
  oldcategories:
  - meta
  status: published
  timestamp: 10:37 AM Thursday, July 01, 2004 EDT
  wordpress_id: '136'
slug: autopilot
tags:
- meta
title: This Weblog is on Autopilot
url: /weblog/2004/07/01/autopilot/
---

Starting today, this weblog and server will be on autopilot for the next month or so.  I'm
leaving tomorrow around 4am for the 22 hour drive from Pittsburgh to Austin.  Then, on the
10th, I get married and go on a honeymoon and come back sometime near the end of the month.
If for some reason my cable modem dies or my WRT54G goes gimpy, both of which seem to happen
whenever I leave town, the server will be dead for a while.  I'm not even going to try and
explain to my roommate how to fix it.

In the mean time, I've got one little gem for [my loyal reader](http://kenneth.stic.net/)
today.  Pyblosxom (at least the ancient version that I use), got a lot of people to subsribe
to RSS feeds via the wrong method.  This meant they weren't seeing the most up to date information.
Because I want people only to subscribe to the most up to date feed, and screw the category/month
feeds, I had to do some mod_rewrite magic.  Here you go, fixing those
people who subscribed to the wrong feed:

{{ < highlight apache >}}
RewriteCond %{QUERY_STRING} ^.*flav=rss$
RewriteRule ^.*$ /weblog/index.rss? [R,L]
{{ < /highlight >}}

Quickly what this does is check and see if a request ends with flav=rss,
which is what caused all the problems.  If it does, mod_rewrite then
does a hard redirect to the user (in hopes that [bloglines](http://www.bloglines.com/)
will take the hint) to a URL without a <span class="verbatim">QUERY_STRING</span> for the index feed.
