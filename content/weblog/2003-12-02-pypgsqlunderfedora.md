---
date: '2003-12-02T00:18:00-05:00'
old:
  layout: post
  oldcategories:
  - code
  status: published
  timestamp: 12:18 AM Tuesday, December 02, 2003 EST
  wordpress_id: '290'
slug: pypgsqlunderfedora
tags:
- code
title: Fixing pyPgSQL under Fedora
url: /weblog/2003/12/02/pypgsqlunderfedora/
---

The latest update of Fedora from the APT streams appears to break pyPgSQL.
This really sucks for me as my research uses this setup.  Luckily, I patched
the program to understand that a -RH version is
okay.  Just run this patch against your source archive and rebuild.  I'll
submit it to the main project when sourceforge comes back up.

{{< highlight diff >}}
--- ./temp2/pypgsql/pgversion.c 2002-12-01 17:10:51.000000000 -0500
+++ ./pypgsql/pgversion.c   2003-12-02 00:07:00.000000000 -0500
@@ -188,6 +188,9 @@
     if ((*last == 'r') && (*(last+1) == 'c') && isdigit(*(last+2)))
     return (errno != 0);

+    if (pgstricmp(last, "-RH") == 0)
+       return (errno != 0);
+
     return ((errno != 0) || (*last != (char)0));
 }
{{< /highlight >}}
