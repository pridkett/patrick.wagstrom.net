---
date: '2008-03-22T02:36:00-04:00'
old:
  layout: post
  oldcategories:
  - linux
  status: published
  timestamp: 02:36 AM Saturday, March 22, 2008 EDT
  wordpress_id: '344'
oldtags:
- gnome
- linux
- NetworkManager
- wifi
slug: loads-of-wifi-networks
tags:
- NetworkManager
- wifi
- gnome
- linux
title: Loads of WiFi Networks in Network Manager
url: /weblog/2008/03/22/loads-of-wifi-networks/
---

This week was what is becoming my annual pilgrimage to Santa Clara, California for [EclipseCon](http://www.eclipsecon.org/).  Last year during the conference I took [CalTrain](http://www.caltrain.com/) from Mountain View to San Francisco to have dinner with [Kenneth](http://www.kenneths.org/flog).  It was there that I noted that NetworkManager unceremoniously crashed my laptop when it was exposed to the hundreds of networks visible on a mid-speed train barreling through the Valley.

This year I repeated the experiment and found that NetworkManager never crashed. Here's a little bit of proof in the form of a screenshot that shows just a small fraction of the number of available networks.  This was taken sometime earlier in the trip -- there were only about 75 networks in the scroll view at this point.  At some points there were well over 300 networks in the scroll view.

<img src="/weblog/media/2008/03/loads-of-wifi.png">
It wasn't completely 100% yet.  There still was the tiny little issue of a very slow and non-responsive user interface when activating NetworkManager, but it's certainly a good start to see it can handle so many networks.  Perhaps next year I'll try and see how it handles multiple network cards during the trip.