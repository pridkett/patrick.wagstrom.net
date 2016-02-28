---
date: '2003-10-27T23:52:00-05:00'
old:
  layout: post
  oldcategories:
  - meta
  status: published
  timestamp: 11:52 PM Monday, October 27, 2003 EST
  wordpress_id: '133'
slug: xmlcalendarintro
tags:
- meta
title: XMLCalendar pyBlosxom Plugin
url: /weblog/2003/10/27/xmlcalendarintro/
---

Today I officially created my first plugin for pyblosxom.  I wasn't happy with the calendar plugin that shipped with
it, so I hacked it to ouptput straight XML.  Then the XML can be parsed in XSLT like the rest of the system.  This leads to
a greater amount of flexibility (althought at the moment, it's just outputing the same old calendar).  Eventually I'm going to have to
hack it together so the XMLNS it uses is user configurable, but that shouldn't be that hard.






You can find it at [/projects/pyblosxom/plugins/xmlcalendar.py](/projects/pyblosxom/plugins/xmlcalendar.py). To use it, just include the variable $xmlcalendar in your templates.
