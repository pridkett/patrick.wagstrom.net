---
date: '2003-11-28T09:48:00-05:00'
old:
  layout: post
  oldcategories:
  - web
  status: published
  timestamp: 09:48 AM Friday, November 28, 2003 EST
  wordpress_id: '223'
slug: blockinghotlinking
tags:
- web
title: Blocking Hot Linking with mod_rewrite
url: /weblog/2003/11/28/blockinghotlinking/
---

One of the wonderful things about the Internet is how you can easily link to
other documents that are relevant to whatever topic you're preaching about.
However, one of the most reprehensible things is the process of hot linking to
images served off other people's sites.  Such was the case with [Gene
Expression](http://www.gnxp.com/) while it seems to be a moderately interesting
weblog, and I'm kinda happy he linked to me, it was done completely the wrong
way.

Apparently many people find this whole [Tareq
Kabir](/weblog/random/averageJoe.xml) thing from "Average Joe" a lot more
interesting than I do.  So the person at GNXP.com linked to my article, which
is fine, but also linked to a picture that I had snarfed from
[MythTV](http://www.mythtv.org/).  The problem comes from the fact that his
<img> tag had the complete ref to the image on my site.  Thus every hit on his
page was generating traffic on my page.  This is a very incosiderate thing to
do as it forces other people to pay for your bandwidth.  So off to mod_rewrite
land to figure out how to block it and here's what you do:

{{< highlight apache >}}
RewriteCond %{HTTP_REFERER} !^$
RewriteCond %{HTTP_REFERER} !^http://dreams.wagstrom.net:8080/.*$ [NC]
RewriteRule ^/resources/images/.*\.(gif|png|jpg)$ - [F]
{{< /highlight >}}

Here's what's going on here.  The first line says that if the <span class="verbatim">HTTP_REFERER</span> is
empty then we should ignore the upcoming rule.  The second line says that if
the <span class="verbatim">HTTP_REFERER</span> is a URL from my site, then we'll ignore the upcoming rule.
The third line says that for any file that ends with gif, jpg, or
png in my images directory, an HTTP forbidden result will be returned.  Pretty
simple and straight forward and no more hotlinking from other sites.  If an
image is ref'd from my site, it'll pass, if it's entered without a referrer
string (for instance from a bookmark or something) it will pass also.
Another, more obnoxious alternative is to create a "No Linking" or
"Bandwidth Thief" graphic.  This is a little bit meaner and still
wastes some of your bandwidth, but can be more fun.  To do that, just change
the final rule to something like:

{{< highlight apache >}}
RewriteRule ^/resources/images/.*\.(gif|png|jpg)$ /resources/images/bandwidthThief.png [L]
{{< /highlight >}}
