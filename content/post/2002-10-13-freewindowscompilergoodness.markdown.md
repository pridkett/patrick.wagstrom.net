---
date: '2002-10-13T11:22:00-04:00'
old:
  layout: post
  oldcategories:
  - old
  status: published
  timestamp: 11:22 AM Sunday, October 13, 2002 EDT
  wordpress_id: '70'
slug: freewindowscompilergoodness
tags:
- old
title: Free Windows Compiler Goodness
url: /weblog/2002/10/13/freewindowscompilergoodness/
---

Okay, so I'm taking one undergraduate course this semester.  It's been pretty cool, very low key to this point,  pretty easy, all that  jazz.  I'm learning a thing or two, but not a whole lot.  In all reality, I probably could have tested right out of this course.

So anyway, one of the things that we are required to do is to write a little data communication simulator.  The problem is that the TA wants it to run under Windows.  I haven't programmed for Windows in a couple of years.  But this normally wouldn't be that big of a deal, as long as I stick to normal C++ stuff, it should work for Windows and I can compile it in Linux also.

But here is where it gets a little more interesting, there is extra credit if it gets a GUI to go along with it.  Not being one to shy away from a challenge, I have decided to do it with a GUI.  I'll probably just bolt the GUI on top of the actual core system, but that is besides the point.  So then my thoughts turned to Java, I could write it Java and then include the Java runtime on the CD that I turn in to the TA.  But then I remembered, I don't particularly like Java all that much.  It's fun and all that, but I think I like C and C++ better.

Now I was in a bit of conundrum.  I took a look at [GTK for Windows](http://wingtk.sourceforge.net/), found that it might be kinda interesting, but decided that I wanted C++ goodness.  That and it would require both systems to have [GTK](http://www.gtk.org/) 2.0.0 installed, I only have 1.2.x on my Linux box, and it requires some extra libraries for Windows.  This wasn't all that cool at all.  I didn't want to deal with the headache of a library upgrade in the middle of the semester. Especially one that could break [Galeon](http://galeon.sourceforge.net/) and [Gaim](http://gaim.sourceforge.net/) which are the only two GTK programs I use on a regular basis, but I use them a lot.

Then I remebered about a toolkit called [wxWindows](http://www.wxwindows.org/) that's been around for a long time, but supports GTK, Motif, Windows and Mac widget sets.  This seemed like it could be a very cool thing.  I still lacked a decent way to compile stuffreliably cross platfrom.  Then I found a link to [Dev-C++](http://www.bloodshed.net/devcpp.html) by [Bloodshed Software](http://www.bloodshed.net/).  It utilizes a bit of a modifed GNU toolchain called [minGW](http://www.mingw.org/) (for minimal GNU toolset for windows).  This was looking good.  I also found a package to install wxWindows support (and I should mention SDL, GTK, FLTK and much other support) for Dev-C++.  This made me happy.  So I installed it, created a dummy program, fired it up, and it compiled and made a nice little GUI in Windows.

So I tried to compile it for Linux, it barfed the first time.  Some looking at the code revealed that I hadn't defined an XPM icon for it in Linux.  I just enclosed it in some #ifdef/#endif statements and it compiled perfectly.  Thus, I was happy for a time.

Then came the next step.  I wanted threads.  I've got a vision of how I want this program to operate.  I want the primary and the secondary to be rather independent.  Threads make this delicious.  For Linux, the obvious choice was to use PThreads.  For Windows, I don't have a clue.  This brought some saddness.  MinGW doesn't have thread support, or does it?

Some more help from Google revealed a package from [RedHat](http://www.readhat.com/) of all places called [PThreads Win32](http://sources.redhat.com/pthreads-win32/). Unfortunately it only came with some binaries for GCC for Windows and MSVC. Undaunted, I managed to compile it myself.  Drop in the new DLL files into the directory of my test program, and off it went.  I'm pretty happy.

Maybe sometime coming up here I'll figure out how to make a Dev-C++ package for PThreads so other people can take advantage of this joy.