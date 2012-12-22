title: XMLCalendar pyBlosxom Plugin
timestamp: 11:52 PM Monday, October 27, 2003 EST
status: published
slug: xmlcalendarintro
tags:
- meta
url: /weblog/2003/10/27/xmlcalendarintro/

layout: post
oldcategories:
- meta
wordpress_id: '133'

---

Today I officially created my first plugin for pyblosxom.  I wasn't happy with the calendar plugin that shipped with
it, so I hacked it to ouptput straight XML.  Then the XML can be parsed in XSLT like the rest of the system.  This leads to
a greater amount of flexibility (althought at the moment, it's just outputing the same old calendar).  Eventually I'm going to have to
hack it together so the XMLNS it uses is user configurable, but that shouldn't be that hard.






You can find it at [/projects/pyblosxom/plugins/xmlcalendar.py](/projects/pyblosxom/plugins/xmlcalendar.py). To use it, just include the variable $xmlcalendar in your templates.

