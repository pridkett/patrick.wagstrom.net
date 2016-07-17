---
date: '2004-08-27T15:24:00-04:00'
old:
  layout: post
  oldcategories:
  - academic
  status: published
  timestamp: 03:24 PM Friday, August 27, 2004 EDT
  wordpress_id: '331'
slug: ossimlog4net
tags:
- academic
title: Log4Net Fun
url: /weblog/2004/08/27/ossimlog4net/
---

I've decided that finally need a nice logging framework in place for OSSim.
Without it, it's going to be hard to track down what is going on in the
application.  Being as it's written in [C#](http://mono-project.com/) I've
decided to use [log4net](http://logging.apache.org/log4net/).  Which seems all
nice, but there is one major problem, I can't actually build the software.

You see, in order to build log4net, one needs to use
[NAnt](http://nant.sourceforge.net/), which is basically
[Ant](http://ant.apache.org/) for .Net platforms.  Personally, I don't care
much for Ant because it's not as straight forward as
[make](http://www.gnu.org/software/make/) is.  Also, I don't think it works
with my new [AutoConf](/weblog/academic/ossimAutoconf.xml) goodness.  Anyway,
the other big problem with NAnt is that the current stable version doesn't
compile under Mono.  Apparently it's some sort of regression bug that keeps it
from happening.

So what's a guy to do?  Well, the last stable release was last December, so I
went to download a nightly build. After [some
frobnicating](http://sourceforge.net/tracker/?func=detail&aid=1017700&group_id=31650&atid=402868)
I was able to get it to work and compile.  This was a relief.  So I now have
a working install of NAnt on my system.  But then a new problem showed up.

Apparently massive portions of the NAnt vocabulary have been changed, meaning
that the program doesn't recognize the build files for Log4Net.  This was
annoying to say the least.  Thankfully, they include a binary of Log4Net for
Mono along with the distribution of Log4Net.  So I can use that, but I'm still
not happy becuase I can't build my own and I can't hack on it.  Because I
would really like to implement the ColoredConsoleAppender.  Sigh.

Anyway, logging now works, it's in [subversion](http://subversion.tigris.org/),
which I migrated the repository to yesterday.  Still not entirely comfortable
with subversion yet, but [elte](http://kenneths.org/flog/) was gonna hook me up
with a book on it.  Afterall, I can use it for research.

