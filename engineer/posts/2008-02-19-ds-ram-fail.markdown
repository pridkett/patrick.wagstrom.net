title: Problems with the M3 DS Rumble Ram Pack
timestamp: 03:04 PM Tuesday, February 19, 2008 EST
status: published
slug: ds-ram-fail
tags:
- memory
- homebrew
- hacking
- nintendo
- ds
url: /weblog/2008/02/19/ds-ram-fail/

layout: post
oldcategories:
- ds
oldtags:
- ds
- hacking
- homebrew
- memory
- nintendo
wordpress_id: '343'

---

About a week ago I picked an [M3 DS Real](http://www.m3adapter.com/SLOT-1_Series_M3DS-R.htm) card for my Nintendo DS for playing homebrew, and more importantly, watching movies on a series of annoyingly long flights in the coming months.  After a moderate amount of fighting, including finding out that the SD card I bought for the device wasn't compatable with it and having to pick a new card up, I've been pretty pleased. It works great as a music player, plays back movies from [MythTV](http://www.mythtv.org/) nicely, and I've hooked up some scripts to transcode recorded programs from [Miro](http://www.getmiro.org/), so I can load up on content and then watch it as I sit at the gate waiting for my plane to be delayed again.

A very nice added bonus of the card in addition to the multimedia capabilities is the ability to load Nintendo DS hombrew, including some great games such as [Warcraft Tower Defense](http://ndswtd.wordpress.com/) and [Lemmings DS](http://www.mrdictionary.net/lemmings/). But the big one came after I already had the card -- [Quake 2 for the Nintendo DS](http://quake.drunkencoders.com/index_q2.html).  Like Simon Hall's original [Quake for the Nintendo DS](http://quake.drunkencoders.com/index_q1.html), this version requires the original data if you want to play the full game.  Luckily, I have a Quake 2 CD from way back in the day.  Unlike the original Quake for the DS, this version requires a RAM expansion, the 4MB on the DS just can't handle the game otherwise.  Luckily, the M3 DS Real can be purchased with a rumble ram pack, which supposedly provides 32MiB of RAM and a rumbler for the device.  Sadly, it appears that there is no documentation for how to get the ram to work with homebrew.  Numerous folks with the card are having similar issues with the RAM not being accessible and Quake 2 DS crashing.  I decided to do some investigation of this issue and discovered that most programs detect the ram as a G6 Flash device, which is from the same company.  However, apparently they don't work the same, as [MemtestARM](http://www.pineight.com/ds/) reports errors on the inversion test at address 0x8400000.  Want more evidence, check out the video below:

<div style="text-align: center"><iframe width="420" height="315" src="http://www.youtube.com/embed/5b7PnrIDHP4" frameborder="0" allowfullscreen></iframe></div>

I've done some searching and there doesn't appear to be an API out there for accessing the memory on the M3 Rumble RAM, and with everything mis-detecting it as G6 Flash it means that most programs that use extra ram will crash -- such as [DS Linux](http://www.dslinux.org/).  Looking around, it appears that even the folks behind the card treat it very similar to a G6 flash as the patch for the Opera Browser is called G6_OPERA.ips.  However, I don't own the browser, so I can't even confirm if the patch works properly.

So, does anyone have any idea about how I would access the RAM on this card?  Or should I just spend $20 to get the [EZ Flash 3-in-1](http://www.gameyeeeah.com/ezflash-in-expansion-pack-rumble-black-p-217.html) card that most folks have and is well supported for Homebrew?
