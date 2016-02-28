---
date: '2003-11-08T00:25:00-05:00'
old:
  layout: post
  oldcategories:
  - linux
  status: published
  timestamp: 12:25 AM Saturday, November 08, 2003 EST
  wordpress_id: '197'
slug: fedoraimpressions
tags:
- linux
title: First Fedora Impressions
url: /weblog/2003/11/08/fedoraimpressions/
---

I just installed [fedora](http://fedora.redhat.com/) on my laptop and it wasn't as painless as advertised.
Initially I had thought that I could just do a simple upgrade from my old RedHat 9 installation, but I ran into some
serious snags.  The install procedure progressed just fine and took about 45 minutes or so.  Then I tried to log in, but
GDM crashed, well it didn't crash in the proper way.  Ordinarily when GDM crashes it will try different choosers until one works.  This time
it was complaining about some icon problems with the blue curve theme and would just freeze.






"No problem," I thought to myself.  I can just run init 3 to take the system down to runlevel three and a do a startx.  Unfortunately, this was a no go as apparently my gnome-session was all messed up now.  This is probably because I used an [external repository](http://people.ecsc.co.uk/~matt/repository.html) to give my system [GNOME 2.4](http://www.gnome.org/) shortly after it came out.
I tried to finagle with stuff to get it work, but nothing was happening.  In the end I decided to back up my files (which was interesting given the number of ripped CD's on here) and reinstall completely.






First impressions of Fedora are pretty nice.  The modifications to the blue
curve artwork are welcome.  The graphical bootup screen is also kinda nifty.
Makes it have a bit more eye candy to show to other newbies.  The default
desktop is almost identical to the RedHat 9 desktop.  It was quick to reimport
most of my settings.  Overall things seem zippier, probably as a result of the
distribution being optimized for Pentium Pro class machines.  Now I have to
weigh whether or not I want to try finding an [APT repository](http://www.freshrpms.net/) to stay up to date
or if I just want to try it manually.  Sigh...I love apt.






Some interesting packaging versions to note.  It does ship with [Samba 3.0](http://www.samba.org/), so
I'll probably take some time to learn that and see what's new there.
However, it doesn't ship with [Python 2.3](http://www.python.org/).
I think some of this might be because all the redhat config tools are setup to
run with python 2.2 only.  I didn't think that 2.3 broke code compatability,
but I suppose that it could have.






One very nice thing, and a large part of the reason why I upgraded is because
of the support for cpufreq.  This is something that
I previously had problems with on my laptop.  For a thinkpad A31, run
modprobe speedstep-ich, then as root you can type
echo -n "0%0%100%powersave" > /proc/cpufreq to tell
the system to go into powersave mode or echo -n
"0%0%100%performance" > /proc/cpufreq to tell the system to go
into full performance mode.  I haven't figured out a way to have the computer
do this automagically when the power is unplugged yet, but I hope to hack
something together soon.  This will be helpful for when I'm at the [rfid privacy conference](http://www.rfidprivacy.org/) next week.
