---
date: '2004-10-25T23:02:00-04:00'
old:
  layout: post
  oldcategories:
  - python
  status: published
  timestamp: 11:02 PM Monday, October 25, 2004 EDT
  wordpress_id: '299'
slug: feedparsing
tags:
- python
title: Saving RSS Bandwidth
url: /weblog/2004/10/25/feedparsing/
---

As part of my research I'm writing a custom RSS feed aggregation software to infer some links for social networks out of entries made by open source developers in their weblogs.  Right now I'm using [Mark Pilgrim](http://diveintomark.org/)'s excellent [FeedParser](http://feedparser.org/) to parse all of the feeds. It handles mangled XML very nicely, which is good because Blosxom loves to kick out bad XML (in particular, it doesn't handle the & character that well).

Anyway, I'm trying to be very respectful of bandwidth with this program.  That means not spidering the RSS feeds that often and looking for the tags that could help me out in knowing how often to check back.  Here's the thing, a large majority of the sites don't take advantage of this.  (Of course, neither does my page, but that is because I use crappy PyBlosxom still.)  Anyway, the program records the date and time the feed was last retreived and only fetches if it's been updated since then using the HTTP-if-modified-since header.  If the feed publishes information about this, then it uses the feed's own last modified date.  Also, if the feed has an etag, it will save that and send it the next time.

The results are pretty dismal.   The only sites that seem to consistently send 304's (what I should get if it hasn't been updated) are those hosted on LiveJournal.  I have yet to actually encounter an etag in a feed.  Sigh.  So, I'm stuck wasting large amounts of bandwidth of my own and of other people to run this thing.  You'd think that people might be concerned about this.

The one plus side is that FeedParser does support gzip compression of data.  So, I'd hope that I'm getting some of the feeds sent back a gzip compressed.  I just implemented the code that records this fact.  We'll see how it fares the next time that I run the database update.

Anyway, when I get around to it, I may put a live demo site of some of the stuff up where people can fetch it.  I'm not in a particular hurry because I'm more focused on doing my own work right now.

**Update:** 44 out of 544 total feeds were compressed using gzip.  That's a pretty sorry mark for what should be a group of leading edge computer geeks.