---
date: '2003-10-31T09:16:00-05:00'
old:
  layout: post
  oldcategories:
  - meta
  status: published
  timestamp: 09:16 AM Friday, October 31, 2003 EST
  wordpress_id: '144'
slug: hidingpyblosxomwithmodrewrite
tags:
- meta
title: Hiding Pyblosxom with Mod_rewrite
url: /weblog/2003/10/31/hidingpyblosxomwithmodrewrite/
---

One of the more interesting things about pyblosxom is that it's all based off a
single URL and data is passed to it in the form of a path rather than all on
the hook.  Anyway, this means that unless you want a nasty looking path like
http://patrick.wagstrom.net/pyblosxom/pyblosxom.cgi/2003/oct then you need to
do something to hide it.  There are a few hints that talk about hiding stuff.
But I think that I'd rather do it a more robust way than just renaming the CGI
as something like blog.

So the better way to do it is with mod_rewrite.  This not only allows you to
hide the weblog under a better URL, but also allows you to completely deny
access to items underneath your pyblosxom file tree.  Here's the snippet I used
on my website:

{{< highlight apache >}}
<IfModule mod_rewrite.c>
    RewriteEngine on
    RewriteRule ^/weblog/?$ /pyblosxom/pyblosxom.cgi [L]
    RewriteRule ^/weblog/(.+) /pyblosxom/pyblosxom.cgi/$1 [L]
    RewriteRule ^/pyblosxom/(.+) /weblog/$1 [R,L]
</IfModule>
{{< /highlight >}}

Simply put, this redirects any request for the url <span class="filename">/weblog</span> or <span class="filename">/weblog/</span> to the
file <span class="filename">/pyblosxom/pyblosxom.cgi</span>.  It also redirects any request for a
subdirectory of weblog to the CGI and appends the rest of the URL to it.
Finally, if there is ever a direct request to the URL for the CGI then it will
use a HTTP redirect to point the user to the weblog link.  This means that the
only way to get access files that actually live under <span class="filename">/pyblosxom</span> is through the
CGI.

