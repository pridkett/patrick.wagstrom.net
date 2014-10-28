title: Gnome VFS Mount
timestamp: 10:25 AM Monday, October 11, 2004 EDT
status: published
slug: gnomevfsmount
tags:
- linux
url: /weblog/2004/10/11/gnomevfsmount/

layout: post
oldcategories:
- linux
wordpress_id: '155'

---

Today's neato hack is [Gnome VFS Mount](http://primates.ximian.com/~sandino/gnomevfs-mount/index.html).  This little guy lets you mount Gnome VFS
directories (such as ssh://username@host/home/username) via the Gnome VFS right
into the Linux tree.  Quite a neat hack indeed.  It's also cool because it
uses Gnome Keyring to avoid asking for a password multiple times.






While this probably has little direct practical use (it still needs lots of
work on caching and what not first), it provides an interesting proof of
concept of what can be possible when everything is a file and you open up the
interfaces to all people.  Maybe one of these days I should get around to
finishing writing my MythTV VFS system, which was a little thing I started
to play with when I was hacking on the auto bittorrent stuff for
[MythTV](http://www.mythtv.org/).  It was all pythonified, so
probably not the best solution, but still interesting.

