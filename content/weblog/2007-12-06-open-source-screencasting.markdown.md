---
date: '2007-12-06T18:26:00-05:00'
old:
  layout: post
  oldcategories:
  - linux
  status: published
  timestamp: 06:26 PM Thursday, December 06, 2007 EST
  wordpress_id: '153'
oldtags:
- collaboration
- fvnc
- gnome
- netmeeting
- presentations
- screencasting
- vino
- vnc
slug: open-source-screencasting
tags:
- fvnc
- vnc
- gnome
- vino
- collaboration
- presentations
- screencasting
- linux
- netmeeting
title: Open Source Screencasting with VNC in GNOME
url: /weblog/2007/12/06/open-source-screencasting/
---

Academics end up giving lots of presentations.  Talks about results, proposals, progress, department functions.  PowerPoint and projectors are nearly ubiquitous.  A trend that's becoming even more common is to have meetings where a portion of the group is at a remote location -- such is the case almost anytime you have remote collaborators.  The typical solution in this case is to send your slides around and hope that other folks can follow along.  While this works okay, it forces the people on the other end of the line to flip through slides all the time and hope they're on the right page.  It also forces you, as the presenter, to unnaturally announce what slide you're on at periodic intervals.

It doesn't have to be this bad, however.  Lots of enterprises deploy NetMeeting for remote collaboration -- usually it works pretty nicely, as long as everyone is running Windows.  If you're giving a presentation from Linux, you're going to need something more.  As far as I know, there isn't a solution quite as good as NetMeeting for Linux, but in this article, I show how you can create a screencast using only Open Source software.

The core technology behind all of this is [VNC](http://en.wikipedia.org/wiki/VNC), which is nothing more than a simple remote framebuffer protocol.  It's not particularly efficient, but it works pretty nicely.  In the "bad old days", VNC under Linux required you to start a special X server.  Local interaction was done through a VNC client -- which meant a laggy and unnatural feeling even while working on your own system.  Modern day GNOME has fixed this nicely with Vino.  To start sharing your desktop, go to **System->Preferences->Remote Desktop**.  This brings up a little window that allows you to activate the Vino desktop sharing software.  For a screencast, you'll want to allow others to view, but not control your desktop.  Disable confirmation, and optionally require the user enter a simple password, like "abcde", or something trite like that.

<img src="/weblog/media/2007/12/desktopSharingPreferences.png">
At this point, you'll have a VNC server that is ready to serve out to anyone who has a VNC client.  However, if you're like most people in Academia, at least in my research field, you won't have a VNC client installed.  There are Java VNC clients, but this is far from ideal beacuse the Java browser experience is still subpar.  Instead, we utilize a Flash based VNC client, [FVNC](http://osflash.org/fvnc), to do the dirty work.  It's fast, clean, and almost everyone has flash in their browser.

To get there, however, you'll need to install a simple HTTP server on your machine.  In Ubuntu run sudo apt-get install lighttpd, to install the excellent lighttpd web server.  Next, grab a copy of FVNC, and copy it to `/var/www/FVNC.swf`. As of this writing, the FVNC website has broken links to the compiled FVNC binary, so you'll either need Adobe Flex or just trust that [this copy of FVNC.swf](/resources/flash/FVNC.swf) is legit.

Finally, we need to tell lighttpd to use `FVNC.swf` as the index page.  Open up `/etc/lighttpd/lighttpd.conf` and search for `index-file.names`.  Add `FNVC.swf` to the beginning of this list as shown below and restart lighttpd using `/etc/init.d/lighttpd restart`.

    :::lighty
        ## files to check for if .../ is requested
        index-file.names           = ( "FVNC.swf", "index.php", "index.html",
                                       "index.htm", "default.htm",
                                       "index.lighttpd.html" )


Now, you should be able to open up your browser and go to [http://localhost/](http://localhost/) and be greeted with the FVNC connection screen.  It defaults to some random IP address, you'll want to enter in localhost at this point
for testing.  A password prompt comes up and after entering your password, a copy of your screen pops into view (be careful about where you place the window as this can cause a nice infinite tunnel effect.

Now, before giving your talk, if you know what IP you'll have, send around an email giving your IP address, and the instructions to enter the IP address in the form and the password.  With very little work, your remote colleagues will be watching your presentation as you flip through the slides.  No more calling out numbers for them.

As an aside, I do not have a compiler for FVNC, but it would be great if someone could make a custom .swf file that automatically connects to a VNC server at the same IP address as the web server, that would save one more hassel and make this process pain free for remote participants.

**Update:** Apparently, Adobe provides free copies of [Flex for students and faculty](http://www.adobe.com/products/flex/productinfo/faq/#flex_faculty) just by sending them a copy of you ID card.  Pretty slick.  Now it looks like I'll have to modify FVNC myself.