title: More on MythTorrent
timestamp: 09:17 PM Sunday, February 13, 2005 EST
status: published
slug: moreonmythtorrent
tags:
- mythTorrent
url: /weblog/2005/02/13/moreonmythtorrent/

layout: post
oldcategories:
- mythTorrent
wordpress_id: '282'

---

I'm surpised by how many people have emailed me about
[MythTorrent](/mythTorrent) over the past few days.  I didn't expect
that people actually noticed when I posted stuff here.  Anyway, here
is a bit more of an explanation of how it works.

First of all, it is an independent python script that connects to your
master database using the MySQLdb database driver.  From there it
queries the recorded table and gets a list of all of the most recently
recorded shows.  It then goes and creates torrents for any of the
files that it hasn't already done so and finally registers the
torrents with my tracker (just the default BitTorrent tracker).

Now the seeding is the difficult part.  It seeds all of the shows by
firing up individual instances of BitTorrent to seed them.  There has
got to be a better way to do this.  Maybe if I actually read the docs,
this might be easier, but for now it works.  However, I've only got
about 30GB for my Myth box right now (although I'll get some more soon
because Staples is gonna have hard drives on sale next week, thank you
[FatWallet](http://www.fatwallet.com/)), so this is still feasible,
firing up about 30 instances of BitTorrent.

Where I'm going to run into problems is what happens when I've got
more shows.  If I pick up a 200GB hard disk and each show is 500 megs,
that 400 BitTorrent processes.  Clearly that isn't going to work, from
a memory perspective or a bandwidth perspective.  Oh yeah, I think
BitTorrent can only have 200 ports or so in use.  So I'm gonna need to
look at this some more.

What I'm going to need to do is figure out a way to have a client seed
multiple files, or merely act as a virtual seed for multiple files.  I
don't intend on allowing everyone in the world to download shows from
me, in fact, this is more of an academic exercise than anything else.
Just to show it can be done.  However, I want this to work well and
not be a crappy hack.

Right now the RSS feed isn't always updated properly.  At least not on
this server, and the URLs for the torrents are all mangled because I
don't want other people hitting the torrents (I don't want to land in
copyright violation land).  They get updated periodically from my
MythTV Backend (700MHz athlon) to my web server (200MHz K6).
Although, there is no reason why the K6 couldn't run MythTorrent right
now.

Now the $3.75 question, "when will I release this?"  The answer is
sometime.  That's about the best I can say.  I'm busy this week with
school and then my presentation at SunBelt (come see me babble about
Open Source weblogs and infering social structure on Friday
afternoon).  I've got a wonderful red-eye back to Pittsburgh on Sunday
night, so I might work on it some there.

That is all for now.  Time to dig up some papers to read for my
research.  I'm still really burnt out from qualifiers and haven't been
focused at all.
