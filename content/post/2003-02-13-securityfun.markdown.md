---
date: '2003-02-13T05:07:00-05:00'
old:
  layout: post
  oldcategories:
  - old
  status: published
  timestamp: 05:07 AM Thursday, February 13, 2003 EST
  wordpress_id: '80'
slug: securityfun
tags:
- old
title: Security Fun
url: /weblog/2003/02/13/securityfun/
---

So I went all freaky about the fact that I thought my box at school was compromised today because school was filtering packets for a couple of well known viruses.  I'm quite relieved that I don't have to reinstall the whole mess again.  But I did learn a few things in the mean time.  Most notable, I put some tools on my local computer here to help protect myself.   You might find them interesting too.

First off is [chkrootkit](http://www.chkrootkit.org/).  This nifty little tool examines a bunch of the files on your system to see if they might have been corrupted.  Basically if [chkrootkit](http://www.chkrootkit.org/) find anything strange you're screwed because you've already been rooted.

I also installed [portsentry](http://www.psionic.com/products/portsentry.html).  This nifty little tool sits and listens to connections coming to my computer.  When it detects that someone is trying to connect to my computer on bad ports (anything other than 22, 25, and 80) it immediately drops the packets from them and causes TCP wrappers to deny their connections.  Overall I must say that it's quite sweet.  It wouldn't be great for a server at school, but for my local system it rules.

Because I hate reading logs, I installed [LogSentry](http://www.psionic.com/products/logsentry.html).  This basically emails me on the hour if something weird is happening on my system.  That should be pretty nice.

Finally, I've got [HostSentry](http://www.psionic.com/products/hostsentry.html) running.  It's not that big of a deal because I've got so few users that can connect to my computer, but it monitors and looks for strange things, like connecting from IP addresses that are out of the ordinary and what not.

Oh yeah, I also updated all of my iptables firewall scripts too.  I'll post those at some point in the future.
