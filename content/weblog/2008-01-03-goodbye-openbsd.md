---
date: '2008-01-03T00:37:00-05:00'
old:
  layout: post
  oldcategories:
  - computer
  status: published
  timestamp: 12:37 AM Thursday, January 03, 2008 EST
  wordpress_id: '110'
oldtags:
- JeOS
- linux
- OpenBSD
- ubuntu
- virtualization
slug: goodbye-openbsd
tags:
- computer
- OpenBSD
- virtualization
- linux
- ubuntu
- JeOS
title: Goodbye OpenBSD
url: /weblog/2008/01/03/goodbye-openbsd/
---

My servers have run [OpenBSD](http://www.openbsd.org/) since sometime in 1998.  I still have a few really ancient official CD sets laying around for OpenBSD 2.3 (May 1998), 2.5 (May 1999), and 2.7 (June 2000).  My name can be found on the [OpenBSD Donations page](http://www.openbsd.org/donations.html), and I think that [PF](http://www.openbsd.org/faq/pf/) is one of the sweetest pieces of software I've seen.   I've ran OpenBSD on x86, PPC, and Sparc on both physical and virtual hardware.  I've used it as a mail server, spam filter, firewall, web server, database server, and even an X11 terminal.  OpenBSD is just a well engineered piece of software that works well and doesn't need much maintenance.

Last year, in an effort to reduce clutter in my house and ease my power bill, I [changed from a physical to virtual OpenBSD box as my main Internet server computer](/weblog/computer/virtualized-server.txt).  For the most part I had some good luck, it worked pretty well once I changed the virtual NIC from a PCNet to an E1000. Back in October I decided that this holiday season I would upgrade to the 4.2 release of OpenBSD, which contained a lot of features I was looking forward to such as a port for Python 2.5 and the new [vic VMWare network driver](http://www.openbsd.org/cgi-bin/man.cgi?query=vic&sektion=4).  About a week after I made this decision, my Apache server process began to randomly segfault when using gzip compression to serve web pages -- as someone who runs their website off a cable modem, this was a hit that I really didn't want to take. I disabled gzip compression and decided to look at it again over the holidays.

The process of bringing up a new virtual machine with [VMWare server](http://www.vmware.com/products/server/) is nearly brain dead.  I can create multiple virtual machines in a matter of minutes.  For this upgrade the choice was made to start fresh to avoid some of the botched installs from previous versions of tools in the original virtual machine.  My strategy was to install the basics for the machine, then compile the ports I needed -- apache2, subversion (with apache support), python 2.5, screen, and irrsi -- were at the top of my list.  Wait, you may say, OpenBSD offers compiled packages for these -- no need to compile.  This is true, but the Python setup includes the tkinter libraries, which no ones uses anymore and forces X on my system.  Subversion also links to some packages I'll never use again.

After some fighting the build process got running, but I almost immediately hit a snag.  Programs were complaining about [expat](http://expat.sourceforge.net/) not being present, and the port kept on telling me it was included as of OpenBSD 4.2.  As I had OpenBSD 4.2 installed, I could tell that it was not included.  My first strategy was to lie and build the package regardless.  While this allowed me to build some software, it quickly caused problems.  I was soon modifying my FLAVOR environment variable with reckless abandon.  In the end, I broke enough things that I needed to start over.  Luckily, VMWare makes that simple.

A little sleuthing discovered that for some reason in OpenBSD, expat is currently a part of the xbase package, and if I wanted the development headers I also needed the xshare package too.  What?  Why I do need X for everything all the sudden.  Whatever, I installed those packages, rebuilt the software, but still needed to fudge around with lots of environment variables to keep it from installing TCL with anything that had optional TCL bindings.  Don't even get me started on the headache of keeping Ruby off my system.  After about six hours of actual work at fighting with it, much more if you count compilation, I had the software I thought I needed installed.  A little testing revealed that all of my web services still worked.  Great! Then I turned on gzip and the segmentation faults returned.  I returned to the default configuration, and the segmentation faults continued.  I debugged the program, realized I need to do some nasty patching, and concluded that this wasn't going to be the proper choice.

It was time to consider something else.  I really wanted to run a BSD system still, I figured I'd give [FreeBSD](http://www.freebsd.org/) a shot again.  For some reason their automatically discovered mirror for me was ungodly slow, worse than dialup.  Going through [tor](http://tor.eff.org/) actually managed to speed things up.  Wow, that's strange isn't it?  I also noticed they were close to a release -- I don't want to run pre-release software and I didn't want to have to upgrade, and I'm really impatient.  Crap.  By this point it was the 27th, and I was supposed to leave for a week in just a few days.

Suck it up, install [Ubuntu Server](http://www.ubuntu.com/server).  I really didn't want to run Linux, and Ubuntu Server may have a bit too much stuff on it in the default install.  I was already starting to feel dirty.  A little more digging revealed a nifty project, [Ubuntu JeOS](http://www.ubuntu.com/products/whatisubuntu/serveredition/jeos) (Just Enough Operating System), a specialized and stripped down version of Ubuntu that has the core software and an optimized VMWare kernel.  The download was pretty small, at about  50MB or so. Installation was a breeze and incredibly straightforward.  As an added bonus, VMWare tools compiles for Linux, to further improve performance.  A few apt-get commands later and my system was running. What's better is that the packaging system didn't require me to install X11, TCL, Ruby, PHP, or MySQL for my server setup.  I was able to get just the tools I needed.  Total installation time for everything, 41 minutes.  That includes the time to copy all my web files over, port the httpd.conf file to the  Ubuntu style of multiple configuration files, and update some absolute paths in scripts.

Next up was to see how fast it was.  I always loved how few processes I'd see running in my OpenBSD machine.  Hammering the machines over and over an testing the speed of response with [YSlow](http://developer.yahoo.com/yslow/) showed the Linux box to complete requests in about 40% of the time of the OpenBSD box when requested from the local LAN.  Furthermore, the responses were compressed, which means a great saving of time over the line.  I was hooked -- sorry OpenBSD, you've been replaced.

Of course, there is a potential cost here.  What about the security of my new server?  What about stability?  What about updates?  As far as security goes, I'm already being fairly smart by running it in as a virtual machine.  The main filesystems are backed up nightly to both local and remote systems, and about once a month, a [backupninja](http://dev.riseup.net/backupninja/) script shuts down the machine, creates a snapshot of the full machine, then restarts it.  That gives me about 10 minutes of downtime every month -- I'm sure the spiders will understand.  I also am not running any unnecessary servers -- just apache2, an instance of [CherryPy](http://www.cherrypy.org/) for [PennAve](http://pennave.sf.net/), and very restricted [OpenSSH](http://www.openssh.com/) for remote access -- that's it.  I'm hoping I'm in good shape with that, but security is something you can never guarantee unless the machine is off, has no drives, and lacks any sort of persistent memory (of course, I'm sure that even then there may be a way to find some sort of electromagnetic residue in the RAM).  Stability wise, I'm not entirely certain.  Ubuntu Dapper on my MythTV machine has been excellent, while Gutsy on my laptop is sometimes flaky -- but that may also be because of a long upgrade chain going back up to March of 2005 on this machine.  Finally, I'm pretty sure that using APT makes upgrades, especially security related upgrades, even easier.  I don't need to worry about seeing that a patch was released and installing it by hand.  It just happens -- yes I'm placing trust in a remote entity, but I can handle that.  I just want my machine to work.

So, after two days of mucking around with OpenBSD, I finally got Ubuntu JeOS to just work, and I'm very happy with it.  I'm sorry to see OpenBSD go, but it was just too difficult to work with.  In particular, here's some issues that really need to be addressed to make it competitive with what JeOS offers:

  * If you say you include expat, really include it, don't place it in two different packages for X.  I don't need X on my server.
  * Finer grain package control.  Some packages are getting pretty good at creating subpackages for optional components -- subversion is a good example of this.  Other packages, such as Python, could really use some help here.
  * Inheritance of the FLAVOR environment variable.  If I compile subversion as NO_TCL or NO_RUBY, that should cascade down to swig.  I had to literally watch every dependency as it was compiled to make sure that it was going to decide I needed TCL, TK, and Ruby.
  * Automated checking for security patches.  I'm not sure if OpenBSD has this, but it wasn't obvious how to do it.  But, then again, it's not immediately obvious how to use apt either.

For the time being, OpenBSD and I have parted ways.  In a few years when it comes time to upgrade my server again, we may again join forces.  Of course, with the continual increase of software as a service, in a few years, there may be no need for me to run my own server anymore