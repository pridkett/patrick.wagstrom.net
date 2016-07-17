---
date: '2003-12-09T23:17:00-05:00'
old:
  layout: post
  oldcategories:
  - code
  status: published
  timestamp: 11:17 PM Tuesday, December 09, 2003 EST
  wordpress_id: '291'
slug: sourcehighlightpatch
tags:
- code
title: GNU Source Hightlight Patch
url: /weblog/2003/12/09/sourcehighlightpatch/
---

[GNU Source Highlight](http://www.gnu.org/software/src-highlite/source-highlight.html) is a nice little piece of software that makes it easy to highlight the code that I might want to include in my blog.  It doesn't work for everything, but works well enough and tends to generate prettier output than VIM does.  However, it doesn't quote element attributes and therefore does not generate valid HTML. Here is a patch for it that makes it properly quote attributes:

{{< highlight diff >}}
--- src/genhtml/htmldecorator.cc.orig   Tue Dec  9 22:53:27 2003
+++ src/genhtml/htmldecorator.cc    Tue Dec  9 22:53:55 2003
@@ -55,7 +55,7 @@
 void
 TagDecorator::generateAttrVal() const
 {
-  (*sout) << " " << attr << "=" << val ;
+  (*sout) << " " << attr << "=\"" << val << "\"";
 }

 void
{{< /highlight >}}