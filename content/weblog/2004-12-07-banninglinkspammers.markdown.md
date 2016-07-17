---
date: '2004-12-07T13:22:00-05:00'
old:
  layout: post
  oldcategories:
  - meta
  status: published
  timestamp: 01:22 PM Tuesday, December 07, 2004 EST
  wordpress_id: '126'
slug: banninglinkspammers
tags:
- meta
title: Banning Link Spammers
url: /weblog/2004/12/07/banninglinkspammers/
---

Yesterday I talked about how to
[cache RSS feeds in PyBlosxom](/weblog/meta/rssCaching.xml) using only
[mod_rewrite](http://httpd.apache.org/docs/mod/mod_rewrite.html), a
cron job, and a package of
[hostess twinkies](http://www.twinkies.com/).  Today, I'm going a
little further.  I've been having problems with link spammers hitting
my pages and using up my bandwidth.  I'm pretty sure they're all
coming from the same source, but they're not the same block of IP
addresses, maybe they're zombied.  Anyway, the urls are all terribly
predictable like http://www.car-insurancedeals-4u.info/ or something
like that.  Anyway, they're all .info domains with multiple dashes in
the domain name.  Being as there are basically no legitimate .info or
.biz sites, I can guarantee that someone is up to no good.  On the
offhand that you are .info site that would like to link to me, I can
allow the link by changing my config.  Just email me.

Anyway, I whipped up a bit more mod_rewrite fun to look at the referer
and if they're from one of these "sites", then it sends them a
forbidden error.  Should help save some bandwidth and also stop these
idiots from appearing all the time in my logs.

    :::apache
        # Ban link spammers
        # this stops any domain of the form: xxx-xxx.info (or derivitave of that)
        RewriteCond %{HTTP_REFERER} ^http://.*(-.*)+\.info/ [NC]
        RewriteRule ^.*$ - [F]


I realize that this has the potential to turn into an arms race.  Oh
well.  Maybe some day I'll get around to building a better firewall
for my network and have this all done through
[pf](http://www.openbsd.org/faq/pf/) or
[layer 7 filtering](http://l7-filter.sourceforge.net/) or something
like that.
