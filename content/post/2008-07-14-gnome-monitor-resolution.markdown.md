---
date: '2008-07-14T11:50:00-04:00'
old:
  layout: post
  oldcategories:
  - linux
  status: published
  timestamp: 11:50 AM Monday, July 14, 2008 EDT
  wordpress_id: '347'
oldtags:
- gnome
- laptop
- linux
- monitors
- x11
- xrandr
slug: gnome-monitor-resolution
tags:
- xrandr
- gnome
- linux
- x11
- laptop
- monitors
title: Dual Monitor Happiness in GNOME
url: /weblog/2008/07/14/gnome-monitor-resolution/
---

As far back as the middle of 2000 I've been using multiple monitors for my daily work routine (see [this screenshot for some proof](http://patrick.wagstrom.net/screenshots/shots/20000830.jpg).  That's done with a couple of PCI voodoo cards and a built in RAGE AGP card).  It's probably one of the best decisions you can make regarding your work productivity, especially if you work on a laptop.  I'm not the only one who thinks this either, Jeff Atwood of CodingHorror.com frequently extols the [virtues of multiple of monitors](http://www.codinghorror.com/blog/archives/001076.html) and points to a study that found that individuals using 2 20 inch monitors were 44% more productive than
those using a single 18 inch monitor.  Of course, people using a 24 inch monitor were 54% more productive than the 18 inch monitor, and by transitive property, the most productive.

However, with laptops, it isn't the case that you can just buy a bigger monitor.  In fact, I'm probably not the only person who wishes that their laptop was actually smaller -- and I've got a fairly small laptop right now, a 14.1 inch IBM T43p, but it's absolutely huge
compared to my wife's X series.  To solve some of these issues, I have external monitors both at home and in the office that help out considerably.  However, like most things in Linux, multi-monitor support is painful.

Or, rather it was, until [Keith Packard](http://www.keithp.com/) gave the X subsystem a good swift boot to the head with XRandR 1.2, which now allows hotplugging of monitors.  Gone are the days of having to kill my X session to do a presentation.  It's bliss baby.  However, Keith is not a GUI genius, at Boston GNOME Summit 2006 he threatened the community with designing his own GUI.  Immediately everyone was revolted as Keith showed the most popular GUI he designed: xmille.

<div class="image caption center">
    [![](/media/2008/07/xmille-screenshot.jpg)](/media/2008/07/xmille-screenshot.jpg)

    <p>A thumbnail of the xmille GUI. Really, you don't want to click it to see the whole thing, it's painfully bad.</p>
</div>

Well, for the most part, the community didn't respond.  In late 2007 when I started running the betas of Ubuntu Gutsy, I needed to features of XRandR 1.2 for presentations.  Well, the only GUI at the time, GRandR, was done by a someone working with Keith at Intel, it crashed
fairly often.  I fixed some bugs, and posted my own [git public repository](http://patrick.wagstrom.net/weblog/code/grandr-public-git-repo.xml) last year.  The problem is that I didn't have time to really maintain the project.

I was pleasantly surprised to see that Ubunty Hardy (2008.04) included a wonderful little applet as part of the GNOME control center, the Monitor Resolution Settings applet.  Using this little applet, XRandR 1.2 compliant drivers (basically any open source driver) get a great little GUI to easily set and configure monitors.  It even allows the arbitrary location of monitors relative to one another.  It's a great little tool.  Now, if only the open source ATI drivers supported accelerated monitor rotation on a second head, then I could actually rotate my 20 inch monitor at home for working on long documents.  For the time being, this works well enough.  In fact, it's a lifesaver when giving presentations.  Nothing spells tacky like having everyone see your login as you kill X to give a presentation.

<div class="image caption center">
    ![](/media/2008/07/gnome-monitor-resolution.png)

    <p>The beautiful new monitor settings applet in Ubuntu</p>
</div>