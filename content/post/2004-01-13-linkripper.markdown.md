---
date: '2004-01-13T22:22:00-05:00'
old:
  layout: post
  oldcategories:
  - code
  status: published
  timestamp: 10:22 PM Tuesday, January 13, 2004 EST
  wordpress_id: '289'
slug: linkripper
tags:
- code
title: Ripping links out of OpenOffice Documents
url: /weblog/2004/01/13/linkripper/
---

Today I received one a syllabus for one of my classes as a word document with a
buch of hyper links in it.  The hyperlinks are important as they link to the
readings for the course.  Clicking them all by hand would have taken a little
while, so undaunted I sought about another way.

[OpenOffice.org](http://www.openoffice.org/) makes this quite easy.  Just save
the file then unzip it and you've got some XML files with all your document
guts in it.  And as you should know, XML is yummy.  So here is the program that
I wrote to rip the links.  The program code is released to the public domain
because it's only a few lines long.

{{< highlight python >}}
import libxml2
import sys

def riplinks(filename):
    doc = libxml2.parseFile(filename)
    ctxt = doc.xpathNewContext()
    ctxt.xpathRegisterNs("xlink","http://www.w3.org/1999/xlink")
    res = []
    for mem in ctxt.xpathEval("//*[@xlink:href]"):
        res.append(mem.prop("href"))
    return res

if name == "main":
    if len(sys.argv) < 2:
        print "Usage: %s FILENAME" % (sys.argv[0])
        sys.exit(0)
    for mem in riplinks(sys.argv[1]):
        print mem
{{< /highlight >}}

Using, so for my case all of the links had the word "classpapers" in them, so I used the
following command line to download them all:

    python linkripper.py content.xml | grep classpapers | xargs wget

In an ideal world someone would hook this up with the zip module for python and
have it automagically look at the content.xml file if it's a zip, but this
isn't ideal right now.  I've got other stuff to do.

**Update:** I made linkripper so it uses zipfile to automagically read Open
Office documents.  Read about it [here](/weblog/code/linkripper2).
