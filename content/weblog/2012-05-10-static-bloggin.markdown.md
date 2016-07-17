---
comments: true
date: '2012-05-11T00:36:00-04:00'
old:
  layout: post
  oldcategories:
  - meta
  status: published
  timestamp: 12:36 AM Friday, May 11, 2012 EDT
oldtags:
- blog
- meta
slug: static-bloggin
tags:
- blog
- meta
title: Static Bloggin
url: /weblog/2012/05/11/static-bloggin/
---

This is my first new post written in markdown for the static version
of
[patrick.wagstrom.net/weblog](http://patrick.wagstrom.net/weblog). The
only reason I was running both PHP and MySQL on my server was to host
wordpress which became a pain in the ass with all of the
upgrades. This eliminates all of those nasty security holes and allows
me to focus a little bit more on just writing. Which is what a weblog
is supposed to be.

I'm running [Octopress](http://octopress.org/), which is a blogging
framework based on [Jekyll](http://jekyllrb.com/). The downside to
this is that means that it cannot accomodate dynamic elements,
therefore all comments need to be farmed off to an external
service. Fortunately, I was already using
[IntenseDebate](http://www.intensedebate.com/). With only a very small
amount of work I was able to migrate everything over to the new
system. Perhaps most substantial is that I had to write a patch to
Octopress to support IntenseDebate. I've since created a
[pull request for IntenseDebate support](https://github.com/imathis/octopress/pull/557)
on Github. Hopefully the authors will see fit to pull it in.

So yeah, it's a little more work now that I don't have a web interface
to do things like manage images and remember my links, but I can write
posts from any text editor, which is VERY handy for when I'm stuck in
airplanes and too cheap to pay for WiFi.

Overall I'm not certain if this is a good idea. In the past I've
extolled various reasons why
[you shouldn't try to do it yourself](http://patrick.wagstrom.net/weblog/2008/12/10/youre-too-smart-to-do-it-yourself/). However
there is also merit to doing it yourself. Up until this point I've
been an active Ruby Hater, and it's becoming clear that I should at
least be peripherally aware of what Ruby can do. Although my
extensions to this point have not involved hacking Ruby, it might at
some point in the future.

So, for now, enjoy the fact that every post is showing up again in
your RSS reader and marvel at the beautiful new theme. With no more
worries about annoying security faults and a faster response time.