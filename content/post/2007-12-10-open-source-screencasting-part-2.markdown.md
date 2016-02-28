---
date: '2007-12-10T00:21:00-05:00'
old:
  layout: post
  oldcategories:
  - linux
  status: published
  timestamp: 12:21 AM Monday, December 10, 2007 EST
  wordpress_id: '206'
oldtags:
- collaboration
- flash
- flex
- fvnc
- git
- netmeeting
- presentations
- screencasting
- vnc
slug: open-source-screencasting-part-2
tags:
- flex
- git
- vnc
- fvnc
- collaboration
- flash
- presentations
- screencasting
- linux
- netmeeting
title: Open Source Screencasting part 2
url: /weblog/2007/12/10/open-source-screencasting-part-2/
---

This is a followup to my original article on [Open Source Screencasting with VNC in GNOME](/weblog/linux/open-source-screencasting.xml) from a few days ago.  Since then, I've been on a bit of an adventure learning about Flex, ActionScript, and finding out ways that I can manage to hack on this nifty little program with minimal pain.

The most important thing, is that I've found the [free Flex2 SDK](http://www.adobe.com/products/flex/downloads/).  The compiler and tools appear to be written in Java, so they'll work just fine under Linux.  Of course, there are those that will be quick to note that these tools are only free as in beer, and not Free as in speech.  This means that if you're not a student and you can't get your hands on FlexBuilder for free, you can still hack
on the code.

Thanks to these tools, I've been able to start modifying the original code to [FVNC](http://www.osflash.org/fvnc/) to suit my needs as screencasting application.  Thus far, I've added a set of extra parameters that can be passed in the flashVars attribute of the embed tag.

  * **server** - a servername to populate connection list with
  * **port** - port number to connect to
  * **connect** - set to "true" if you'd like to autoconnect based on values from server and port variables.
  * **hide** - set to "true" if you'd like the connection dialog to automatically disappear when connect is called.
  * **fit** - set to "true" if fitToScreen should be automatically checked
  * **title** - set to a value for a new title in the app
  * **disableServer** - set to "true" to disable changing server
  * ** disablePort** - set to "true" to disable changing port

Thus, through some interesting use of the **server**, **port**, **connect**, and **hide** flashVars, I can make it so opening the page automatically connects to the VNC instance and allows the user to start viewing the presentation right away (or be prompted for a password first).  This really has taken the resources necessary for a remote presentation down quite a bit.

For my talks, I'll probably combine this with the free conference service from [Gizmo](http://www.gizmoproject.com/), that allows folks to dial in with regular phones and then listen to the talk and slides at the same time.  It's a pretty slick solution.  If only there was a nice way to include a component in the modified FVNC that also channeled my voice and some video, then it would be really great.  I'd imagine there is a way to do that using some of the nifty stuff in Flex2, but I'm by no means an expert in the technology.

In the mean time, if folks would like my modifications, including a precompiled binary of the modified FVNC.swf program, you can get it by using git and cloning [http://patrick.wagstrom.net/git/fvnc.git](http://patrick.wagstrom.net/git/fvnc.git).