---
date: '2003-12-09T22:23:00-05:00'
old:
  layout: post
  oldcategories:
  - meta
  status: published
  timestamp: 10:23 PM Tuesday, December 09, 2003 EST
  wordpress_id: '150'
slug: fixfiletime
tags:
- meta
title: Broken File Times with PyBlosxom?  No Problem!
url: /weblog/2003/12/09/fixfiletime/
---

Because PyBlosxom builds the dates for the entries off the last modified time for
an entry and CVS has a tendency to muck these up I decided to build a little tool
fix these.  This tool will look for a string like:

{{< highlight html >}}
<!-- Date: 2003-12-09 22:23 -->
{{< /highlight >}}

In a file and if it finds it then it sets the file date to the date contained.
Works wonders for rebuilding an archive after a mess with CVS.  Syntax
highlighting courtesy of GNU source highlight.  Here is the code:

{{< highlight python >}}
#!/usr/bin/env python 
"""
This handy little script fixes file dates. It opens up the file 
and if there is a line that looks like this: 

It will set the mtime of the file to the date listed there. It’s 
very nice for pyblosxom which bases ordering off the mtime of the 
file. It’s also great for when CVS decides to randomly change 
your file dates. 

By Patrick Wagstrom 

Released under terms of the GNU General Public License Version 2 

$Revision: 1.1 $ 
$Id: fixfiletime.txt,v 1.1 2003/12/10 04:21:43 patrick Exp $ 
""" 
import os, time, sys 

if len(sys.argv) < 1: 
    print "Usage: fixfiletime.py filename" 
    sys.exit(1) 

filename = sys.argv[1] 
try: 
    filestats = os.stat(filename) 
except: 
    print "File not found. Quitting." 
    sys.exit(1) 

print "Processing File: ", filename 
try: 
    filebody = open(filename) 
except: 
    print "Cannot open file %s - exiting" % (filename) 
    sys.exit(1) 

body = [x.strip() for x in filebody.readlines() if x.lower().startswith("<!– date:")] 
filebody.close() 
if len(body) > 1: 
    print "I’m confused, multiple line matches!" 
    print body 
    sys.exit(1) 
if len(body) == 0: 
    print "No match" 
    sys.exit(1) 

newdate = body[0].split() 
timetuple = time.strptime(newdate[2]+" "+newdate[3],"%Y-%m-%d %H:%M") 
newmtime = time.mktime(timetuple) 

filestats = os.stat(filename) 
atime, mtime = filestats[7:9] 
print "Old mtime: ", time.asctime(time.localtime(mtime)) 
print "New mtime: ", time.asctime(time.localtime(newmtime)) 
try: 
    os.utime(filename, (atime, newmtime)) 
except Exception, e: 
    print "Failed to set the new time.", e 
    print "Quitting." 
sys.exit(1) 
{{< /highlight >}}

This file is also available on my [projects page](/projects).
