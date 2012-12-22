title: More on Banning Link Spammers
timestamp: 09:57 AM Wednesday, December 08, 2004 EST
status: published
slug: morelinkspammerfun
tags:
- meta
url: /weblog/2004/12/08/morelinkspammerfun/

layout: post
oldcategories:
- meta
wordpress_id: '128'

---

Looking through my weblogs I saw that I also was getting a lot of hits
from
[http://www.xopy.com/friendslinks.php](http://visualintensity.com/adminshop-com),
at first I thought it was a nifty site like
[del.icio.us](http://del.icio.us/) that allowed you to see friends
links.  It turns out that they're part of a group called
[AdminShop](http://visualintensity.com/adminshop-com/), and they're
basically doing link spamming.  So I needed to add them to my block
list.

Now this seems to cut down on most of my link spamming.  However, it
still isn't ideal.  I guess in an ideal world I'd set up small little
CGI that I'd force them to.  Once they hit they CGI they'd get their
IP address logged and immediately sent to pf for banning of the
client.  I suppose I could whip something like that up pretty easily,
but I don't have time right now.  And no, that doesn't mean it will be
done by tonight, I've got plenty of other stuff to do before then.

Also, I switched many of my redirects from 302 (temporary) to 301
(permanent) yesterday, however [BlogLines](http://www.bloglines.com/)
doesn't seem to have taken the hint.  Any ideas on how you can force
BlogLines to recognize a 301 and update its database if its repeatedly
received?  Also, I'm wondering why the request from BlogLines don't
include the
[If-modified-since or the If-none-match headers](http://fishbowl.pastiche.org/2002/10/21/http_conditional_get_for_rss_hackers)?
If they did it would save them bandwidth and the hassle of having to
parse thousands of feeds that aren't updated on a daily basis.

