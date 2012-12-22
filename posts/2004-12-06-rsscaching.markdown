title: Caching RSS Feeds With PyBlosxom
timestamp: 09:47 AM Monday, December 06, 2004 EST
status: published
slug: rsscaching
tags:
- meta
url: /weblog/2004/12/06/rsscaching/

layout: post
oldcategories:
- meta
wordpress_id: '147'

---

It's getting to the point where I need to stop doing server generation
for my RSS feed whenever it is requested.  Mainly because RSS seems to
be eating a majority of my bandwidth and doing the server side
generation doesn't give an etag or a last modified date, this makes
[conditional get](http://fishbowl.pastiche.org/2002/10/21/http_conditional_get_for_rss_hackers)
broken when people try to fetch my feed.  Fortunately, Apache can
handle this stuff if I do a static file.

I'm getting sick of hacking up PyBlosxom, so I decided to do this
using some mod_rewrite voodoo and a cron job.  The first thing that
you'll need is a cron job to periodically request the feed.  This is
how I have my entry:
    
    0 * * * * cd /home/patrick/Documents/www ; wget http://patrick.wagstrom.net/weblog/index.rss --user-agent="Cacher" > /dev/null ; if [ -f index.rss.1 ]; then mv index.rss.1 index.rss; fi
    
This fetches the feed once an hour and saves a copy in my root directory for
my web server.  You'll notice that I tell WGet to use a special user agent
that I call "Cacher" to fetch the document.  Next we need some mod_rewrite
foo to change it all around.

    :::apache
        	RewriteCond %{HTTP_USER_AGENT} !Cacher
                RewriteRule ^/weblog/index.rss /index.rss [L]


This looks at the user agent of the request and sees if it is not
"Cacher", if that is true, then it redirects silently to the cached
file.  Now, this may create some small delay in geting my feed
updated, but it should also reduce the overall bandwidth consumption
of my RSS feeds.  Sigh, just another sign I need to finish Priblog.
