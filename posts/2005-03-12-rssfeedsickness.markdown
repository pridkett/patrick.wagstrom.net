title: My RSS Feed Is Sick
timestamp: 11:04 AM Saturday, March 12, 2005 EST
status: published
slug: rssfeedsickness
tags:
- meta
url: /weblog/2005/03/12/rssfeedsickness/

layout: post
oldcategories:
- meta
wordpress_id: '138'

---

Apparently my [RSS feed](http://patrick.wagstrom.net/index.rss) is sick.  I'm
not quite sure why.  There are two major ways that this sickness is showing itself.  Firstly,
it's not putting spaces around links on [BlogLines](http://www.bloglines.com/).  This
was pointed out by a helpful reader and it appears to be doing it on all my entries.  Secondly,
when I read the entries on [Blam!](http://www.imendio.com/projects/blam/) it really does
a good job of mangling them.

I've tracked this down to a few different problems in my setup.  First
off, I need to point out that I'm using
[PyBlosxom 0.82](http://roughingit.subtlehints.net/pyblosxom/) and
have no intention of upgrading.  I've got too many custom modules to
deal with.  Anyway, basically PyBlosxom just takes an entry and pastes
the entire contents into the page returned.  While this works well for
HTML pages, in an RSS feed I need to escape all the < and > symbols.
Or at least I think I do.  In any case, I'm pretty sure the unescaped
HTML in the body is confusing Blam!  The unescaped HTML also makes my
feed fail to validate as most of the HTML tags are not defined for
RSS.

The other problem is that I use some custom XML in these pages.  When
you view the pages on the web at
[http://patrick.wagstrom.net/weblog/](http://patrick.wagstrom.net/weblog/),
you're really downloading a plain old XML file.  This XML file has a
preprocessor directive that tells your browser to go grab an XSLT
stylesheet to render the page.  If you're using
[FireFox](http://www.spreadfirefox.com/?q=affiliates&id=38177&t=82) to
read this, do a view source command to see what I mean.  Your browser
then takes care of transforming the XML into HTML on the client side.
It's all rather neato.  If you have a browser that can't do this
properly, like Internet Explorer, then the server does it for you, but
only for the HTML pages.  This means that when you download the RSS
feed, you still see these weird XML tags because the feed has not been
run against my stylesheet.  For example in the RSS feed, you may see
something like <my:imagestrip>...</my:imagestrip> instead of a nice
row of pictures.  This is my special markup for a strip of images in
the web page.  Well, that won't get rendered in your feed reader.
Suckage.

Fortunately, if we remember that the actual page is XML, we might be
able to cook up a solution.  It's not a secret that I'm not a big fan
of the way that PyBlosxom does some stuff, especially how much of the
stuff like RSS is hard coded.  What I can do is cook up an XSLT
stylesheet that will take the same XML that your browser downloads and
use that to create an RSS feed.  Which is probably what I'm going to
do.  However, I've got a
[machine learning](http://www-2.cs.cmu.edu/~guestrin/Class/10701/)
test on Monday and a house to buy a week after that, so don't expect
it real soon, but you never know.  When that happens, I'll also try to
make a nice ATOM feed so I can hang out with the cool kids.
