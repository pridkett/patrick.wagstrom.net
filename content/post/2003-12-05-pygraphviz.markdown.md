---
date: '2003-12-05T17:46:00-05:00'
old:
  layout: post
  oldcategories:
  - code
  status: published
  timestamp: 05:46 PM Friday, December 05, 2003 EST
  wordpress_id: '263'
slug: pygraphviz
tags:
- code
title: Python Module for Graphviz Interaction
url: /weblog/2003/12/05/pygraphviz/
---

I'm having to use the [AT&T Graphviz](http://www.research.att.com/sw/tools/graphviz/) tools quite a bit for generate graphs for my research.
As I like programming in Python, I decided to write a simple wrapper that would go and call the actual tools.  This wrapper lets you create and save neatly-formatted
dot files and also provides and easy interface to render them.  I use it on an interactive web page to generate graphs on the fly.  It can't load graphviz files yet, not
sure if I'll ever get around to that.  Anyway, you can find that on my [projects page](/projects/#pygraphviz).
