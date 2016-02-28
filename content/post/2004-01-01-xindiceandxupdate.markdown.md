---
date: '2004-01-01T21:58:00-05:00'
old:
  layout: post
  oldcategories:
  - code
  status: published
  timestamp: 09:58 PM Thursday, January 01, 2004 EST
  wordpress_id: '316'
slug: xindiceandxupdate
tags:
- code
title: Nifty Programs
url: /weblog/2004/01/01/xindiceandxupdate/
---

Over the last few days I've been writing my own XML database in Python, today
I discovered [Apache Xindice](http://xml.apache.org/xindice/) (it's
pronounced zeen-dee-chay).  It seems like it could be a lot like what I'm
trying to do.  Only it's written in Java and I hate Java.  So I'll continue
on doing my Python stuff for Pridb.






One other interesting thing that I found was
[XUpdate](http://www.xmldb.org/xupdate/) which is a query language
for XML database.  I'll play around with that some more too.  It uses XPATH
to select elements also, so that's a bit of a plus as Pridb already uses
XPATH for selections.  I'll consider implementing that later, but I happen to
be a bit of a fan of the SQL like syntax I've got going right now.
