---
date: '2005-03-05T14:00:00-05:00'
old:
  layout: post
  oldcategories:
  - mythtv
  status: published
  timestamp: 02:00 PM Saturday, March 05, 2005 EST
  wordpress_id: '168'
slug: transcoding
tags:
- mythtv
title: Ubuntu NFS Woes Ate My Forrest Gump
url: /weblog/2005/03/05/transcoding/
---

The title about sums it up.  Apparently [Ubuntu](http://www.ubuntulinux.com/) is being bit in the ass by a rather nasty [NFS server bug](https://bugzilla.ubuntu.com/show_bug.cgi?id=6749) that prevents writing to the NFS drives.  It just creates 0 byte files.  Well, not exactly.

I realized that when my laptop (2GHz) is on the wired connnection it can transcode recorded programs much faster than my master backend (700MHz).  So I figured I'd have the laptop transcode [Forrest Gump](http://www.imdb.com/title/tt0109830/) and [Vacation](http://www.imdb.com/title/tt0085995/) for me.  I went through and cut out all of the commercials and set the laptop to trim the files for me.  It seemed like everything was going well enough.  A check on the NFS directory showed the .nuv.tmp files were be created by mythtranscode.  There were a few errors being spit out by the laptops instance of mythbackend, but usually I can ignore those.  Then disaster.  When done transcoding the original .nuv file is removed and replaced by the .nuv.tmp file.  This failed. Bye bye Forrest.

So I'm back to transcoding on the Athlon backend, no biggie, just takes longer. But I have to wonder, when will I be able to replace Forrest?  Sigh.  Let's hope the good guys at Ubuntu get this fixed soon.  Until then, DO NOT USE KERNEL 2.6.8.1-5 ON UBUNTU.  At least not if you're running an NFS server, it'll hork your files and eat your children.