title: 'LazyWeb: Ogg->AAC converter'
timestamp: 02:32 PM Tuesday, August 02, 2005 EDT
status: published
slug: oggconverter
tags:
- iTunes
- mp3
- aac
- iPod
- lazyweb
- ogg
url: /weblog/2005/08/02/oggconverter/

layout: post
oldcategories:
- lazyweb
oldtags:
- aac
- iPod
- iTunes
- mp3
- ogg
wordpress_id: '24'

---

Over the last few years I've managed to rip quite a few of my CD's to [OGG Vorbis](http://www.vorbis.com/) format.  While it's partially a political statement, it's more just a technological issue. OGG is better than MP3 and it's easier for me to get going under Linux. Anyway, a few months ago [Kristina](http://kristina.wagstrom.net/) bought an iPod Mini, which sadly does not play OGG (note to self: email [Apple](http://www.apple.com/) about getting OGG support). 

This leaves us in a conundrum as I don't want to rerip all of my music, and Kristina would like to not have rip everything either.  I've found [Davyd Madeley's OGG->MP3 script](http://www.livejournal.com/users/davyd/135047.html).  This works just fine under linux (mad props to [GStreamer](http://gstreamer.freedesktop.org/) folks).  But that still leaves us with the fact that MP3 is [teh suck](http://www.urbandictionary.com/define.php?term=teh+suck).

A little hacking shows that there are AAC plugins for GStreamer (based on [libfaac](http://www.audiocoding.com/)) and that they [should be able to create AAC files](http://gstreamer.freedesktop.org/releases/gst-plugins/0.8.8.html).  Unfortunately, with GStreamer 0.8.8 this does not seem to be the case.  Which is sad, because I might actually consider converting my music to AAC, but that's not going to happen now. 

So here's what I'd like to do, provide an easy way for Kristina to load OGG files, transcoded of course, onto her iPod.  Ideally, it would be cool if this could be relatively transparent.  Here's our setup to work with: 

  * music hosted on [Ubuntu](http://www.ubuntulinux.com/) Hoary
  * Client runs Windows XP Home edition
  * Relatively new iPod Mini

Samba takes care of the file access.  Is there a way I can make a virtual sort of share that automatically transcodes music as it is accessed (similar to what [KDE](http://www.kde.org/) does with KIO Slaves?).  This would be the ideal situation.  If that's not possible, is a way to have iTunes transcode from OGG when it gets ogg files?  If that's not possible, anyone know of a simple desktop app that my wife could use to transcode between OGG and AAC or MP3?

Yeah, this is a lazyweb request.  I've done my share of searching on this problem.  I dislike how everything in the windows world is hidden behind a "pay me now" ideology.  ::sigh::  There is an [OGG QuickTime component](http://qtcomponents.sourceforge.net/), but I've heard mixed results on that.

ps: don't even try and suggest [iPod Linux](http://www.ipodlinux.org/Main_Page).  I'm not going there with Kristina's iPod.  Both her and I have something better to do.
