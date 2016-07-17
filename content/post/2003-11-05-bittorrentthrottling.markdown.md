---
date: '2003-11-05T23:10:00-05:00'
old:
  layout: post
  oldcategories:
  - linux
  status: published
  timestamp: 11:10 PM Wednesday, November 05, 2003 EST
  wordpress_id: '191'
slug: bittorrentthrottling
tags:
- linux
title: Bittorrent On A Slow DSL Line
url: /weblog/2003/11/05/bittorrentthrottling/
---

Today the new release of [fedora](http://fedora.redhat.com/) came out.  Like
any good sensible people, rather than getting slashdotted, they put up some
bittorrent releases for people to download.  Anyway, so while I was at school
today I was getting 400k/s on both the upstream and downstream channels.  When
I went home I was only getting 8k/s download and about 16k/s upload.  Needless
to say I was not pleased.  It also was quite difficult for me to go look at
other stuff on the net.  The problem is that my upstream communications were
saturating the line and drowning out the necessary packets (including ACKs for
downstream data).  When I went and I throttled the uplink to 10k/s magically
the downstream connection jumped to 80k/s.  So the lesson, if you're on a DSL,
throttle the upstream to slightly below your maximum throughput.

The alternative solution is to set up a firewall to [prioritize outgoing
acks](http://www.benzedrine.cx/ackpri.html).

