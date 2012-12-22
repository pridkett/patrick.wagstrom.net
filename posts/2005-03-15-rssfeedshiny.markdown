title: Oooh, a Shiny New RSS Feed
timestamp: 11:14 AM Tuesday, March 15, 2005 EST
status: published
slug: rssfeedshiny
tags:
- meta
url: /weblog/2005/03/15/rssfeedshiny/

layout: post
oldcategories:
- meta
wordpress_id: '141'

---

This is sort of a test entry and sort of an entry to explain what I've been doing.
It's a test entry because I'm not sure if the problem with spaces on [BlogLines](http://www.bloglines.com/)
has been cleared up or not.  I hope it has.  If it hasn't then I know a ghetto way to
fix it, but it involved encoding hard non-breaking spaces around hyperlinks, which is not
quite ideal.

Anyway, I think I've got everything going well enough that most of my weird markup should
handle properly.  I did uncover a strange behavior with [libxml](http://www.libxml.org/)
that exhibits itself on [OpenBSD](http://www.openbsd.org/).  Under Linux, which is what my
laptop runs, I could write an xpath expression like: //my:verbatim, and it
would handle all of the instances of that tag in the document.  However, for some reason in OpenBSD
when I was processing my:blogEntry entries I needed to expressly specify
//my:blogEntry//my:verbatim in order for the expression to grab all the
nodes I wanted.  Not the worst thing, but still moderately annoying.  It could be a result of old
libraries on my server too.  I'm not quite sure about that.

I also made a few more changes to my script to generate the RSS feed.  In particular, you should
notice that all of the links, even the ones that used to be relative, now work from the RSS feed.
I imagine that there is a way to it in XSLT, but it only took a few lines of python to fix these:

    :::python
        res = ctxt.xpathEval("//a/@href")
        for x in res:
            ctnt = x.content
            if ctnt.startswith("/"):
                ctnt = "http://patrick.wagstrom.net" + ctnt
                x.setContent(ctnt)


Basically I'm hard prepending [http://patrick.wagstrom.net](http://patrick.wagstrom.net/)
to any link that appears to be relative.  I'm sure at some point this will have unintended consequences.
I've done a similar thing for my image blocks to display those in the RSS feed, so now you can finally
see when I post images in my weblog through the feed.  Except that you might occassionaly get bandwidth
thief graphics.  As I find referers that are causing these, I'll white list them.  I needed to install
referer checking because some folks were causing me to use massive amounts sending out pictures that were
mine with no credit given to me.  Sigh.  Yay for the interweb.
