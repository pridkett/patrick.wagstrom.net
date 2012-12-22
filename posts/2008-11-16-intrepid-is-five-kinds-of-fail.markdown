title: Ubuntu Intrepid Ibex is Five Kinds of Fail
timestamp: 08:31 AM Sunday, November 16, 2008 EST
status: published
slug: intrepid-is-five-kinds-of-fail
tags:
- linux
- intrepid
- ubuntu
- fail
- NetworkManager
- thinkpad
- atheros
- pulseaudio
url: /weblog/2008/11/16/intrepid-is-five-kinds-of-fail/

layout: post
oldcategories:
- linux
oldtags:
- atheros
- fail
- intrepid
- NetworkManager
- pulseaudio
- thinkpad
- ubuntu
wordpress_id: '351'

---

I've been a Ubuntu user since before it was called Ubuntu, back in the days when the domain name was no-name-yet.com.  It wasn't a hard switch from Fedora Core, which at the time was Core 1 or Core 2.  Ubuntu was like entering a magical world where stuff just worked.  At the time I had an IBM ThinkPad A31 -- it worked perfectly, wifi and all.  Now, things weren't quite as good as they are now, the magic of [NetworkManager](http://projects.gnome.org/NetworkManager/) had not yet arrived, and [DBUS](http://dbus.freedesktop.org/) was just a thought in [j5's mind](http://www.j5live.com/).

The various revisions of Ubuntu made it better and better.  Improvements to [multi-monitor support](/weblog/linux/gnome-monitor-resolution.xml) were wonderful -- suddenly presentations were easy.  With Ubuntu Hardy basically everything on my laptop worked.  Wifi, suspend, sound, bluetooth.  It was really nice.  Unfortunately, it appears that Intrepid is a step backward -- numerous features that were supported in Hardy no longer function properly.  So, here I present my Intrepid Ibex Five Kinds of Fail.



	
  1. NetworkManager periodically disables networking ([291062](https://bugs.launchpad.net/ubuntu/intrepid/+source/network-manager/+bug/291062))

	
  2. Atheros drivers are no longer properly supported ([259157](https://bugs.launchpad.net/ubuntu/intrepid/+source/linux/+bug/259157))

	
  3. PulseAudio sometimes hangs after suspend/resume ([292129](https://bugs.launchpad.net/ubuntu/+source/pulseaudio/+bug/292129))

	
  4. My thinkpad occasionally fails to suspend ([298683](https://bugs.launchpad.net/ubuntu/+source/linux/+bug/298683))

	
  5. NetworkManager forgets my WPA saved key ([276578](https://bugs.launchpad.net/ubuntu/+source/network-manager/+bug/276578))


I'm not intending this to be another "Linux Sux0rs" post or anything like that, but here are five major issues that worked just fine in the last version of Ubuntu and now are total fail making the Ubuntu experience of today remind me of the Ubuntu experience from Dapper days.  There is certainly some irony that several of the features relate to wifi which Ubuntu brags about having great support for in Intrepid.  Maybe I should have heeded [jwz's advice when he lamented about upgrading three years ago](http://www.dnalounge.com/backstage/log/2005/10.html).  Sigh...Here's hoping Jaunty won't have the same problems.
