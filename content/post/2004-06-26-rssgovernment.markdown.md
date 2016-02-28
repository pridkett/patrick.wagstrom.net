---
date: '2004-06-27T00:27:00-04:00'
old:
  layout: post
  oldcategories:
  - code
  status: published
  timestamp: 12:27 AM Sunday, June 27, 2004 EDT
  wordpress_id: '307'
slug: rssgovernment
tags:
- code
title: RSSGovernment
url: /weblog/2004/06/27/rssgovernment/
---

While searching for information related to the INDUCE/IICA act on [Thomas](http://www.congress.gov/), I began to wonder, why not make a more flexible architecture for it.  Ideally I'd like to see something like RSS Government, read on to see what I mean.

RSS Government (or Atom Government, for those of that persuasion) would provide a method to subscribe to RSS feeds about action in the house and senate.  Not only would it allow you to subscribe to the overall feed, but also for a particular bill.  Each night, a program would go out and crawl [Thomas](http://www.congress.gov/) for any new information and then update the feeds.

After downloading the data, it would then parse the data to figure out what was discussed and create the appropriate feeds.  Thus I could just add in the feed on IICA into [Straw](http://www.nongnu.org/straw/) and I would never have to worry about being out of date.  One can also think of other interesting things, like providing a feed about any votes taken in congress, etc.  If I only I never needed to sleep, I could get so much more done.