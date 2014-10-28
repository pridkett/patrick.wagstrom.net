title: Quick patch for SHFS
timestamp: 12:17 PM Monday, February 02, 2004 EST
status: published
slug: shfsmountpatch
tags:
- code
url: /weblog/2004/02/02/shfsmountpatch/

layout: post
oldcategories:
- code
wordpress_id: '279'

---

[SHFS](http://shfs.sourceforge.net/) is a nifty littly LUFS system that lets me do filesystems over ssh.  When combined with automount I can do cool like just go to the directory /mnt/net/ssh/patrick@dreams.wagstrom.net and automatically have access to my files.  It's quite cool.  The problem arises from the lack of ability to specify a port to shfsmount from the mount command.  This means if you have an SSH server listening on a port other than the default 22, you can't use automount to get access to it.  Luckily, this patch allows you to specify a port as an option to mount in the form port=XXXX.  Thus, I can set up a new directory and access it via /mnt/net/ssh8022/patrick@dreams.wagstrom.net to get access to the SSH server on port 8022.  Very nice if you've got multiple systems behind a firewall.  In face, that's what I'm using to do this port right now.  Damn cool!

[sourcecode language="c"]
--- ./shfs-0.32.old/shfsmount/shfsmount.c       2003-11-04 06:35:59.000000000 -0500
+++ ./shfs-0.32/shfsmount/shfsmount.c   2004-02-02 11:47:26.000000000 -0500
@@ -287,6 +287,13 @@
                                        s = r;
                                }

+                               /* extra code to allow passing of a port as */
+                               /* and option of "port=XXXX" */
+                               if (!strncmp(s, "port=", 5)) {
+                                       execv[j++] = "-p";
+                                       execv[j++] = (char *)&amp;s[5];
+                               }
+
                                if (strlen(opt)+1+strlen(s)+1 &lt; sizeof(opt)) {
                                        strcat(opt, ",");
                                        strcat(opt, s);
[/sourcecode] 
