---
date: '2008-12-10T23:43:00-05:00'
old:
  layout: post
  oldcategories:
  - web
  status: published
  timestamp: 11:43 PM Wednesday, December 10, 2008 EST
  wordpress_id: '387'
oldtags:
- software
- weblog
- wordpress
- you're doing it wrong
slug: youre-too-smart-to-do-it-yourself
tags:
- web
- weblog
- software
- wordpress
- you're doing it wrong
title: You're Too Smart To Do It Yourself
url: /weblog/2008/12/10/youre-too-smart-to-do-it-yourself/
---

The Internet is a great place of open standards and open implementations that allows just about anyone to put together their own services.  The plethora of programming languages that advertise themselves as being well suited for web development gives a developer a number of different swiss army knives to use in creating their new service.  Even after we've picked a language, or just settled for the language that we're most familiar with, there are more frameworks than you can shake a stick at.  Of course, you're not an expert in all of those frameworks, and they probably don't work exactly as you want to, so what are you supposed to do?  Build your own of course!

If we take Python as an example, it should be obvious to everyone that with systems like [Django](http://www.djangoproject.com/), [CherryPy](http://www.cherrypy.org/), [Pylons](http://www.pylonshq.com/), and [Pyjamas](http://pyjs.org/), we're clearly in need of a few more web frameworks.  Any one of these would work well for your new weblog software that you want to launch.  This new weblog software, will, of course, be different enough from any of the [dozens of other freely available Python based weblog tools](http://wiki.python.org/moin/PythonBlogSoftware) to justify your time in writing it.  So what's the next step?

**STOP.  STOP NOW.**

You're clearly a smart person if you're thinking about writing your own web framework.  You've been able to look over the other tools and decided that the features that you want aren't provided in any given one of those frameworks.  You've worked out a plan and already sketched your ideas on the back of the napkin.  Heck, maybe you've even gone so far as to start a [git](http://git.or.cz/) repository so other people can access your data.  You're going to make it open source and it's going to rock and your new weblog software is going to be great too!

But why should anyone care?

Well, they probably won't.  Unless you're unemployed and looking to create a cool project that you can build a consultancy on at some point the real world is going to intrude and you're going to have something better to do.  Usually this happens within a couple of days.  Now you've already gone and migrated your weblog over to whatever your new software to show how cool it is -- except that suddenly it's unmaintained, because the maintainer, in this case you, has gotten bored of working on the project now that it's past the "sexy" phase.

In addition to having any little bugs that may arise with your nice new weblog software, you're also stuck unable to utilize lots of the cool new technologies that are out there.  If you want [OpenID](http://openid.net/) or [reCaptcha](http://recaptcha.net/), you've got to write the code yourself.  This is a great way to learn about those technologies, but is it really what you're an expert at?  Wouldn't it be easier if someone else wrote a really good implementation for you?

**OH WAIT...THEY DID.  YOU ALREADY DISCOUNTED IT.**

Remember that weblog software you said sucked way too much back when you started down your path?  Well, that software has a community around.  They've already built a lot of the tools that you're wasting your time building.  And they've built them much better than you would have.  It's more stable, better supported, and is easier to use.  Of course, when you were looking at the software the first time, these things never came up.  If only you had thought ahead.

This happens to lots of folks.  I'm writing this largely out of my own experience.  In January of 2008, I embarked on what I called [The 24 Hour Blog Challenge](/weblog/tags/24hrblogchallenge/), an effort to replace my even older and crappier blog system in 24 hours or less.  While I created a decent enough system, there were enough feature's that weren't implemented or had small quirks that it was hindering my reason for having a weblog -- writing.  I'm not saying that it was a failure to write PostStreet, just that I didn't have enough time or desire to finish it, and you probably won't either.

So what's the solution?  Be smart.  Take advantage of what other folks have done.  In my case, I moved over to [WordPress](http://www.wordpress.org/) (although with frustration as I installed it last night and promptly had to upgrade ti this evening).  Now I've got lots of the cool features I had wanted, such as reCaptcha and OpenID, and none of the hassle of a creaky system.  This should allow me to focus on what I've got expertise in, which is not writing weblog software, but understanding Open Source software and communities.