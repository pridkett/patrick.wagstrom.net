---
date: '2003-12-02T23:10:00-05:00'
old:
  layout: post
  oldcategories:
  - pimpbot
  status: published
  timestamp: 11:10 PM Tuesday, December 02, 2003 EST
  wordpress_id: '304'
slug: pimpbotintro
tags:
- pimpbot
title: Introduction to PimpBot
url: /weblog/2003/12/02/pimpbotintro/
---

Reject was recently updated and as a result of the upgrade some software
that was installed on there no longer works, among them the antiquated
TCL-SQL module that powered the explain module of B|shop (the ircbot of #zoes).
Being as I don't have access to fix it myself, I just decided to write
my own bot.  So here comes PimpBot.






PimpBot is a simple Python script that works with Twisted to provide a
plugin based framework for the creation of an IRC bot.  Everything works
as plugins that are written in Python and loaded at runtime.  Currently
there is a database access module and an explain module.  I'm working
on a userlist module.  After that I'll work on some more channel protection
stuff.  I'll post the code as I get further along, right now I've got
finals and stuff to worry about though.
