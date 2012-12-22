title: Fixing pyPgSQL under Fedora
timestamp: 12:18 AM Tuesday, December 02, 2003 EST
status: published
slug: pypgsqlunderfedora
tags:
- code
url: /weblog/2003/12/02/pypgsqlunderfedora/

layout: post
oldcategories:
- code
wordpress_id: '290'

---

The latest update of Fedora from the APT streams appears to break pyPgSQL.
This really sucks for me as my research uses this setup.  Luckily, I patched
the program to understand that a -RH version is
okay.  Just run this patch against your source archive and rebuild.  I'll
submit it to the main project when sourceforge comes back up.




    
    <font color="#008000">--- ./temp2/pypgsql/pgversion.c 2002-12-01 17:10:51.000000000 -0500</font>
    <font color="#008000">+++ ./pypgsql/pgversion.c   2003-12-02 00:07:00.000000000 -0500</font>
    <font color="#804000"><b>@@ -188,6 +188,9 @@</b></font>
         if ((*last == 'r') && (*(last+1) == 'c') && isdigit(*(last+2)))
        return (errno != 0);
    
    <font color="#008080">+    if (pgstricmp(last, "-RH") == 0)</font>
    <font color="#008080">+       return (errno != 0);</font>
    <font color="#008080">+</font>
         return ((errno != 0) || (*last != (char)0));
     }
    
