title: This Weblog is on Autopilot
timestamp: 10:37 AM Thursday, July 01, 2004 EDT
status: published
slug: autopilot
tags:
- meta
url: /weblog/2004/07/01/autopilot/

layout: post
oldcategories:
- meta
wordpress_id: '136'

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




    
        RewriteCond %{QUERY_STRING} ^.*flav=rss$
        RewriteRule ^.*$ /weblog/index.rss? [R,L]
    





Quickly what this does is check and see if a request ends with flav=rss,
which is what caused all the problems.  If it does, mod_rewrite then
does a hard redirect to the user (in hopes that [bloglines](http://www.bloglines.com/)
will take the hint) to a URL without a QUERY_STRING for the index feed.

