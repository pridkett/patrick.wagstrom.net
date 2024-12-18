---
date: '2003-10-31T23:44:00-05:00'
old:
  layout: post
  oldcategories:
  - meta
  status: published
  timestamp: 11:44 PM Friday, October 31, 2003 EST
  wordpress_id: '140'
slug: fullmonthnames
tags:
- meta
title: Full Month Names in pyBlosxom
url: /weblog/2003/10/31/fullmonthnames/
---

This is a little patch that will give you the ability to get the full month
name of an entry in pyBlosxom.  This is especially useful if you don't like
abbreviations (like myself).  This creates two new variables you can use in
your templates, $month which is the full month name and $daord which is the
ordinal thingey after the number (like "nd", "th", "rd", "st").  Sorry if it
doesn't work for non-English speakers.  Anyone got a better way?

{{< highlight diff >}}
--- /home/patrick/src/pyblosxom-0.8.1/Pyblosxom/entries/base.py Fri Jun  6 08:10:06 2003
+++ /home/patrick/Documents/www/pyblosxom/Pyblosxom/entries/base.py     Fri Oct 31 23:39:36 2003
@@ -175,14 +175,20 @@
             is the same thing as the mtime/atime portions of an os.stat.
         @type  timeTuple: tuple of ints
         """
+        nthday = ["", "1st", "2nd", "3rd", "4th", "5th", "6th" "7th", "8th", "9th", "10th",
+                  "11th", "12th", "13th", "14th", "15th", "16th", "17th", "18th", "19th", "20th",
+                  "21st", "22nd", "23rd", "24th", "25th", "26th", "27th", "28th", "29th", "30th",
+                  "31st"]
         self['timetuple'] = timeTuple
         self._mtime = time.mktime(timeTuple)
         gmTimeTuple = time.gmtime(self._mtime)
         self['mtime'] = self._mtime
         self['ti'] = time.strftime('%H:%M', timeTuple)
         self['mo'] = time.strftime('%b', timeTuple)
+        self['month'] = time.strftime('%B', timeTuple)
         self['mo_num'] = time.strftime('%m', timeTuple)
         self['da'] = time.strftime('%d', timeTuple)
+        self['daord'] = nthday[int(self['da']) - 1][-2:]
         self['dw'] = time.strftime('%A', timeTuple)
         self['yr'] = time.strftime('%Y', timeTuple)
         self['fulltime'] = time.strftime('%Y%m%d%H%M%S', timeTuple)
{{< /highlight >}}

In general, there seems to be a lot of calls to strftime in this function, I'm
wondering if one call would be quicker and then to split up the output?  Anyone
who is smarter than me wanna take a guess at it?
