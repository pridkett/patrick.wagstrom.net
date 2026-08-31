---
date: '2005-03-12T11:26:00-05:00'
old:
  layout: post
  oldcategories:
  - mythTorrent
  status: published
  timestamp: 11:26 AM Saturday, March 12, 2005 EST
  wordpress_id: '281'
slug: badbloglines
tags:
- mythTorrent
title: More Interesting RSS Problems
url: /weblog/2005/03/12/badbloglines/
---

I just noticed another interesting [Bloglines](http://www.bloglines.com/) problem.  Apparently
BlogLines doesn't properly handly article updating as it should.  This means that if it fetches my
[mythTorrent feed](http://patrick.wagstrom.net/mythTorrent/mythTorrent.rss) while a show is
recording then it will include the show twice, adding it again after the show is completed.  Mainly this
is because the entries for filesize will vary.  The solution to this is to have entries not show up until
after they are finished recording.  Shouldn't be a big deal.  Bear with me, repairs in progress.