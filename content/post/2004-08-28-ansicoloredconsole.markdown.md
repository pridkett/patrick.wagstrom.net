---
date: '2004-08-28T13:01:00-04:00'
old:
  layout: post
  oldcategories:
  - code
  status: published
  timestamp: 01:01 PM Saturday, August 28, 2004 EDT
  wordpress_id: '318'
slug: ansicoloredconsole
tags:
- code
title: AnsiColoredConsoleAppender
url: /weblog/2004/08/28/ansicoloredconsole/
---

Hot on the heels of me [starting to
use](http://patrick.wagstrom.net/weblog/academic/ossimLog4Net.xml)
[Log4Net](http://logging.apache.org/log4net/) in OSSim, comes my first code
addition to the project.  The original ColoredConsoleAppender only works on
Windows because it calls Win32 APIs.  I don't really like that fact because I
use [Mono](http://mono-project.com/) under [Linux](http://fedora.redhat.com/).
However, I remember from my good old [BBS days](http://www.bbsdocumentary.com/)
that you could use ANSI escape codes to do fun colors.  These also work under
Linux as that's what you use to colorize your prompts (something I'm a fan of
as it allows me to easily see what system I'm on).

With a little bit of hacking out comes
[AnsiColoredConsoleAppender](/projects/personal/log4net/AnsiColoredConsoleAppender.cs).
This little puppy works just like the regular ColoredConsoleAppender except
that it works under Linux and MacOSX.  Oh yeah, and you've got a new tag, attrs
instead of adding on HighIntensity to the foreColor tag.  In addition, you have
lots more values for the attrs tag such as Bright, Dim, Underscore, Blink,
Reverse, Hidden, or Strikethrough.  Try it out and send me feedback.
