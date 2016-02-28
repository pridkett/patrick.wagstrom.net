---
title: "Simplifying Your Home Network With a Synology NAS"
date: 2018-12-11T20:51:30-08:00
draft: true
---

This post has been over a year in coming, not so much because it's taken me that long to research everything, but mainly because of changes in Hugo that required some effort to correct. Most of the things in the blog post were done in November and December of 2017.

Back in 2010 I decided that I need to get serious about my data retention and backup strategies. This meant moving to something other taking periodic snapshots to using a real backup service. At the time, the choice was clear, Crashplan was going to be my best choice. Their three year family plan, which was about $400, was great because it let me back up all of my machines to the cloud with no fuss. During that time I had one machine that crashed hard and the backup made all the difference. Crashplan also was a natural choice because it allowed me to backup to a local machine, in my case that was a Drobo attached to various machines that I've owned over the years.

Then, in August 2017, the inevitable happened. [Crashplan, realizing that the enterprise market was far more lucrative than the consumer market, announced they'd be terminating their consumer plan and migrating everyone to a small business plan](https://9to5mac.com/2017/08/22/crashplan-home-being-discontinued/). They offered a reasonable deal on continuing machines onto the small business plan for a year, but after that they'd be full price. For the number of machines I needed to backup, this wasn't going to prove sustainable. This provided the impetus for me to re-examine the machines that I had laying around the house serving my network in an effort to find something better.

At the time I had the following machines that I owned on my home network:

* An [ODroid C2](https://wiki.odroid.com/odroid-c2/odroid-c2) that at one point ran Crashplan on an ARM architecture until they added in a native library component.
* An old [IBM Thinkpad X61 Tablet](http://www.thinkwiki.org/wiki/Category:X61_Tablet) that was serving as my local backup server for Crashplan.
* A [1st Generation Drobo](https://www.engadget.com/products/drobo/1st-gen/) with 4x2TB hard drives for storage attached to the Thinkpad X61 over USB 2.0
* An [IBM Thinkpad X31](http://www.thinkwiki.org/wiki/Category:X31) which I don't what it still did
* A Microsoft Surface Pro 2
* A 2015 13" Mac Book Pro
* A Acer Desktop Machine running Windows 7 Media Center
* An HD Homerun Extend connected to that Acer Desktop
* An Apple TV 4K and an Apple TV 4th Gen
* A Netgear Nighthawk Wifi Router

In short, this is approximately what my network looked like:

[TKTKTK insert diagram TKTKTK]

In addition we had a collection of phones, Kindles, and work machines that aren't directly involved in the story. They're still on the network, but they're wireless devices that don't get backed up in a way that matters here.

