title: I Broke Technorati
timestamp: 11:14 AM Saturday, March 26, 2005 EST
status: published
slug: ibroketechnorati
tags:
- technorati
- weblog
- folksonomies
- meta
- tags
url: /weblog/2005/03/26/ibroketechnorati/

layout: post
oldcategories:
- meta
oldtags:
- folksonomies
- tags
- technorati
- weblog
wordpress_id: '131'

---

I've been adding tags to all of my weblog entries recently.  I think it's
a kinda cool thing to do.  However, if you've been reading my weblog, or even
just the RSS version of it, you'll notice that the tags have been bouncing all
around.  Well, let me explain the reason for this.






[Technorati](http://www.technorati.com/) has set up a system
to [tag weblog entries](http://www.technorati.com/tags).  In this
way, when I write an entry on "linux", people can go visit the
[linux](http://www.technorati.com/tag/linux) tag on
Technorati and see other associated folks who also wrote about Linux.
I've noticed that it's added about 80 hits a day to my weblog.  Which is
pretty impressive.






The basic mechanism is this: somewhere in your weblog when you make a link
you include the attribute rel="tag"
in the link element.  This can be just a general link to the Technorati tag
page or to anything else.  I've chosen to go the simple route and just link
to the technorati tag page, although if I ever finish time suck, it will link
to my unified tag page for my weblog, photos, bookmarks, and articles.  So
the simple way to do this is to include a span of HTML like <a href="http://www.technorati.com/tag/technorati" rel="tag">technorati</a>.  This puts the link there and when Technorati recrawls my page
it grabs the links.






Sounds all good and straight forward, but there is a catch.  Apparently there
is a flaw in the technorati spider (as confirmed by [Kevin Marks](http://epeus.blogspot.com/) in IRC).   Basically, it's associating my tags with
the wrong articles, which is most uncool.   This is difficult to understand as if it's grabbing my RSS feed there is no way this should be happening because the
different tags are in different <item>
elements.  Thus, for my [previous entry where I
mentioned globalization](http://patrick.wagstrom.net/weblog/faith/wallisOnJustice.xml), the tag entry on Technorati takes you to ["A gift to
planet wplug"](http://patrick.wagstrom.net/weblog/web/mpopKiller.xml), which is wrong.  I'm sure it's also confusion people, and I've
gotten one email about polluting the blogspace.  I'm not sure if the spider grabs the
stuff from my web page or the RSS feed, so I've been trying to move articles and tags around in relation to one another.  That's why for right now on my
[rss feed](http://patrick.wagstrom.net/weblog/index.rss) the tags
are at the top of each entry.  I hope to move them back down at some point
in the future, but right now, I just want it to work.  So here's hoping that
the latest sets of updates actually cause everything to work.  If not,
well I guess I keep polutting the tag space until I either get banned or
technorati fixes their site.

