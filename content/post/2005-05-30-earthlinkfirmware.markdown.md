---
date: '2005-05-30T12:54:00-04:00'
old:
  layout: post
  oldcategories:
  - linux
  status: published
  timestamp: 12:54 PM Monday, May 30, 2005 EDT
  wordpress_id: '200'
oldtags:
- earthlink
- hacks
- ipv6
- wrt54g
slug: earthlinkfirmware
tags:
- linux
- wrt54g
- hacks
- earthlink
- ipv6
title: Earthlink Custom WRT54G Firmware
url: /weblog/2005/05/30/earthlinkfirmware/
---

[Earthlink](http://www.earthlink.net/) has released some very cool [WRT54G custom firmware ](http://www.research.earthlink.net/ipv6/)that natively supports IPv6 tunneling.  This makes it trivially easy for anyone to set up IPv6 tunnels to their home.  The fact that big time players are hacking away on this little box is incredibly cool.

I've had IPv6 setup in the past, routing it through my [OpenBSD server](http://www.openbsd.org/) when I used that as my router.  However, then I was using [Hurricane Electric's Tunnel Broker](http://ipv6tb.he.net/) service, which unfortunately was not encrypted. The custom firmware does IPSec encryption over the tunnel to Earthlink.  Of course, you're still stuck in the situation that all your data can be read by Earthlink.

Anyway, maybe I'll get around to installing this, but that means that I'll have to set up my second WRT54G for client mode, instead of the current WDS.  Anyway, it's all good.  We'll see where this goes.  I might just go and put the OpenBSD box back as the router and put my wireless behind it.