title: Stopping Bandwidth Thieves
timestamp: 06:32 PM Monday, December 13, 2004 EST
status: published
slug: bandwidththief
tags:
- meta
url: /weblog/2004/12/13/bandwidththief/

layout: post
oldcategories:
- meta
wordpress_id: '148'

---

I'm progressing well on my war to reclaim bandwidth back from spammers
and other nefarious foul beasts who can barely be classified as human.
Today I had to take a step that I'd rather not do because it becomes a
real pain in the butt, but nonetheless, I needed to do it.

One of the wonderful things about the web is the ability to link to
any document anywhere on the web.  This is great because it means that
we don't need to follow extended instructions on how to locate a
document on a server.  We should all be happy that
[deep-linking is protected](http://www.gigalaw.com/articles/2000-all/kubiszyn-2000-05b-all.html)
and that we don't need to sign asinine
[link agreements](http://www.google.com/search?q=%22link+agreement%22)
to link to websites.  However, for people who run their site off a low
bandwidth link (my cable modem in my case), this can sometimes be a
bad thing.

The problem occurs when that linking turns into bandwidth thievery.
You know, when people post an image or a graphic and pretend like it's
theirs but really just link to yours.  Yeah, it sucks.  This has
happened to me twice in the past month and cost me about 10MB of
bandwidth (which is about 4% of my total usage so far this month).
So, I pronounce Mod_Rewrite Vendetta upon thee!  Here's how to do it:

    :::apache
        RewriteCond %{HTTP_REFERER} !^$
        RewriteCond %{HTTP_REFERER} !^http://patrick.wagstrom.net/.*$ [NC]
        RewriteCond %{HTTP_REFERER} !^http://192.168.*$
        RewriteCond %{HTTP_REFERER} !^http://.*\.bloglines.com/.*$ [NC]
        RewriteCond %{HTTP_REFERER} !^http://.*\.google.com/.*$ [NC]
        RewriteRule ^/resources/images/.*\.(gif|png|jpg)$ /resources/images/bandwidthThief.png [L]


So what's going on here?  Well, we're checking the `HTTP_REFERER` header
to see where the person is coming from.  If it is not a direct link
(indicated by an empty referer), from somewhere on my site, from
within my local subnet, from [Bloglines](http://www.bloglines.com/),
or from [Google](http://www.google.com/webhp?complete=1), then it
matches this rule.  In those cases, it looks and sees if the request
is to an image in my image directory.  If is is, then it automagically
changes it so it shows the much smaller (3400 byte) bandwidth thief
graphic.

What's the interesting thing is that when you deep link to anothers
image, or include it in a bulletin board posting, as was done here,
you're completely at the mercy of the person who hosts the image.  I
could have easily changed that picture to something lewd, profane, or
just generally tasteless and made it look like it came from that user.
Or worse, I could hack up a graphic to make it look like the text in
the board so the person would appear to be saying naughty stuff.
Anyway, I'm not sure if I'll leave this one on or not.  I've had mixed
success in the past with this sort of rule because of the number of
times it triggers when I don't want it to.
