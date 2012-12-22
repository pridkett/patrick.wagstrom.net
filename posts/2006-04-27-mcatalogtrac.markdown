title: MCatalog Trac Available
timestamp: 01:04 PM Thursday, April 27, 2006 EDT
status: published
slug: mcatalogtrac
tags:
- cairo
- mcatalog
- trac
- mono
url: /weblog/2006/04/27/mcatalogtrac/

layout: post
oldcategories:
- mono
oldtags:
- cairo
- mcatalog
- mono
- trac
wordpress_id: '313'

---

I'm making some good progress on my modifications of MCatalog.  I've already managed to remove the old Mozilla based shelf viewer for a shiny new one that uses [Cairo](http://www.cairographics.org/).  This has some nice performance improvements and provides better scaling.  Of course, layout changes are no longer a simple matter of changing HTML, but at the same time, I don't need to muck around with JavaScript anymore.  I might see about removing it for the presentation widget too, saving memory overall (I'm not sure how much more memory each Mozilla rendering widget takes up if Mozilla is already loaded, but I'd imagine it's a lot).

To celebrate my accomplishments, I put up a [MCatalog Trac Server](https://secure.wagstrom.net/projects/mcatalog/).  It contains my web pages describing the project, but and feature requests that come to mind, and you can browse the source code there.  Also, it contains instructions on how to help me out. So, if you're so inclined, please visit [https://secure.wagstrom.net/projects/mcatalog/](https://secure.wagstrom.net/projects/mcatalog/) and start browsing and helping out.

I had really hoped that I wouldn't have to do all this, but I've sent a couple of emails to every email address I could find for the original author and haven't gotten a response.  I may have to try spanish pretty soon here.  I know he's still around, because he periodically [updates his blog](http://www.mcatalog.net/blog/).  That gives me some hope at least.  For right now, I'm almost willing to say it's approaching a fork of the original code.
