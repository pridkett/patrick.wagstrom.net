---
date: '2004-01-31T13:03:00-05:00'
old:
  layout: post
  oldcategories:
  - code
  status: published
  timestamp: 01:03 PM Saturday, January 31, 2004 EST
  wordpress_id: '317'
slug: linkripper2
tags:
- code
title: An updated version of link ripper
url: /weblog/2004/01/31/linkripper2/
---

I noticed that my original implementation of
[linkripper](/weblog/code/linkripper.xml) was put in [Mark
Pilgrim's](http://www.diveintomark.org/) [blinks archive for
January](http://www.diveintomark.org/archives/blinks/2004/01/).  This inspired
me to go and update linkripper to automagically open up zip files, so you don't
need to do that on your own.  Behold, the new version of Linkripper:

{{< highlight python >}}
# linkripper.py
# by Patrick Wagstrom
# this work is dedicated to the public domain
# see: http://creativecommons.org/licenses/publicdomain/
import libxml2
import sys
import zipfile

def readfile(filename):
    data = None
    try:
        zip = zipfile.ZipFile(filename, ‘r’)
        data = zip.read("content.xml")
    except zipfile.BadZipfile:
        data = file(filename,‘r’).read()
    except KeyError:
        print "%s is a zip file, but does not have content.xml in the archive" % (filename)
    return data

def riplinks(filename):
    try:
        doc = libxml2.parseDoc(readfile(filename))
        ctxt = doc.xpathNewContext()
        ctxt.xpathRegisterNs("xlink","http://www.w3.org/1999/xlink")
        res = []
        for mem in ctxt.xpathEval("//*[@xlink:href]"):
            res.append(mem.prop("href"))
        return res
    except:
        print "%s is unable to be parsed" % (filename)
        return []

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print "Usage: %s FILENAME" % (sys.argv[0])
        sys.exit(0)
    for fn in sys.argv[1:]:
        for mem in riplinks(fn):
            print mem
{{< /highlight >}}
