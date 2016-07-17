---
date: '2006-01-14T16:04:00-05:00'
old:
  layout: post
  oldcategories:
  - linux
  status: published
  timestamp: 04:04 PM Saturday, January 14, 2006 EST
  wordpress_id: '183'
oldtags:
- annoyances
- gnome
- HCI
- it shouldn\'t be this hard
- nautilus
slug: bad-nautilus-error-messages
tags:
- linux
- annoyances
- nautilus
- gnome
- it shouldn\'t be this hard
- HCI
title: Useless Error Messages in Nautilus
url: /weblog/2006/01/14/bad-nautilus-error-messages/
---

Here's a prime example of what happens when programmers write error messages:

<img src="/weblog/media/2006/01/uselessErrorMessages.png">
This is an error that was repeated several times for different files when I was copying over some newly ripped CDs from my laptop to my MythTV box. Unfortunately, there are several things wrong with this error dialog that make it useless:

1. I can't see the complete filename, nor can I expand the box to make the complete filename visible.  In this case I could make out where it was having problems, but if I had a common naming structure for files across many directories, I would not be able to tell where it was having problems.
2. "Access Denied" is a very vague term.  Is it access denied on the source or the destination?  Other one of which can cause such a problem.  In this case the problem was a lack of write permissions for the destination directory on the server, but it does not make it clear that if its a problem with reading the file or writing the file.
3. Lastly, it does not make a distinction if this is a file or a directory that it's having problems with.  In this case it was a directory, but given how
Windows and Mac folks are lazy about file extensions, that may not always be so obvious.

It's funny, it seems like an error dialog is such a simple little thing, but making one not work correctly can be big problems.  Chalk this up to another "it's shouldn't be so difficult".