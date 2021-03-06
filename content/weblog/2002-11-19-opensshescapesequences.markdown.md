---
date: '2002-11-19T15:09:00-05:00'
old:
  layout: post
  oldcategories:
  - old
  status: published
  timestamp: 03:09 PM Tuesday, November 19, 2002 EST
  wordpress_id: '68'
slug: opensshescapesequences
tags:
- old
title: OpenSSH Escape Sequences
url: /weblog/2002/11/19/opensshescapesequences/
---

With telnet most people know you can hit ^] to escape back to the program, but
most people don't realize that you can do a similar thing with OpenSSH.  This
is VERY helpful when your session dies.  In OpenSSH the escape key is the
tilde.  Here is the segment from the [OpenSSH
manual](http://www.openbsd.org/cgi-bin/man.cgi?query=ssh).

    *Escape Characters*

         When a pseudo terminal has been requested, ssh supports a number of func-
         tions through the use of an escape character.

         A single tilde character can be sent as ~~ or by following the tilde by a
         character other than those described below.  The escape character must
         always follow a newline to be interpreted as special.  The escape charac-
         ter can be changed in configuration files using the EscapeChar configura-
         tion directive or on the command line by the -e option.

         The supported escapes (assuming the default `~') are:

         ~.      Disconnect

         ~^Z     Background ssh

         ~#      List forwarded connections

         ~&      Background ssh at logout when waiting for forwarded connection /
                 X11 sessions to terminate

         ~?      Display a list of escape characters

         ~C      Open command line (only useful for adding port forwardings using
                 the -L and -R options)

         ~R      Request rekeying of the connection (only useful for SSH protocol
                 version 2 and if the peer supports it)

