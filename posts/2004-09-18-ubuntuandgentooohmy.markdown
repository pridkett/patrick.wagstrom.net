title: Ubuntu, Gentoo, and MythTV, oh My!
timestamp: 03:04 PM Saturday, September 18, 2004 EDT
status: published
slug: ubuntuandgentooohmy
tags:
- linux
url: /weblog/2004/09/18/ubuntuandgentooohmy/

layout: post
oldcategories:
- linux
wordpress_id: '156'

---

I decided to finally reinstall the Myth box yesterday.  I found out some
pretty valuable things.  First, a lot of the problems with the box
can be attributed to the motherboard not liking the large amounts of
DMA transfers the WinTV PVR 250 does.  I'll have to remember to stay
away from Via chipsets in the future as this chipset also has some
flunky problems under Windows 2000 too.  Bad Via.  Bad bad Via.






Secondly, I've also got a weird bios, strike 2 for Via.  I burned the
minimal Gentoo install CD last night, but it wouldn't boot.  Finally, I
gave up and installed [Ubuntu](http://www.ubuntulinux.org/)
instead.  I gotta say, it's a nice desktop opearting system, but there
were some things that made it really annoying.  First is that there was
no way to get a lot of software for it.  Specifically, MPlayer and
XCdRoast.  I figured out how to burn images under Nautilus, but that's just
not as much fun.  Apparently this is because of licensing issues.






Also, by default, it installs a VERY stripped down OS.  We're talking no C
compiler.  This was annoying.  It also suffers from [Debianism](http://www.debian.org/) when it comes to kernel compiles.
This made it hard to install [IvyTV](http://ivtv.sourceforge.net/)
to drive [MythTV](http://www.mythtv.org/).  Then later I realized
that it didn't install an SSH daemon either.  Good for desktop users, bad for
Patrick.  After sleeping on it and dreading needing to reinstall again in a
few months, I decided that I should have installed
[Gentoo](http://www.gentoo.org/).  I downloaded the full CD today,
slapped that on a CD-RW and burnt it.  Right now I'm installing Gentoo.  We'll
see how that works.  At least with Gentoo, it's braindead on how to upgrade
it.






I wish that Ubuntu would have worked, I'd really like to support them, but with
my needs and the state of the distro, it's not gonna happen right now.  Maybe
when the full release comes out, we'll be better off.  Anyway, I'll see about
posting more tomorrow once the compile is closer to being done.  Yay for
compiling in Gentoo!

