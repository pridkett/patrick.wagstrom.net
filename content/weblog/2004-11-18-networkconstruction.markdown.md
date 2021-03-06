---
date: '2004-11-18T23:06:00-05:00'
old:
  layout: post
  oldcategories:
  - computer
  status: published
  timestamp: 11:06 PM Thursday, November 18, 2004 EST
  wordpress_id: '112'
slug: networkconstruction
tags:
- computer
title: Network Construction at CSCW
url: /weblog/2004/11/18/networkconstruction/
---

I've just finished working [CSCW](http://www.acm.org/cscw2004/) at
the Chicago Hilton hotel.  My role there was as both as student volunteer and
as the computing chair.  As computer chair my role was to ensure that the
attendees had network access and were able to connect to the Internet during
the main sessions to participate in back channel conversations.  My role as
a student volunteer was to help out whenever possible.  I didn't need to do
a whole lot in that respect because most of my time was taken up by working on
the network issues.






So let's talk the original vision for the network.  Originally the conference
was going to provide wireless access in the Marquette room on the third floor
of the hotel for use as a email room.  We had a few computers that we rented
and were connected by a wired network to the internet.  Downstairs the main
sessions for the conference were to take place in the Continental ballrooms.
This was one large room that could be separated into three different rooms.
The original plan called for us to use the hotels wireless at their rather
exoborant rate.






However, that would have been far too easy.  A week before I was supposed to
arrive in Chicago, I received an email informing me that the hotel would be
unable to provide the wireless access we requested.  Furthermore the contact
for the hotel would not be in for the next few weeks (the email was
conventiently sent at 7pm on a Friday evening).  Furthermore,  I was also
informed that we now had to plan wireless access for another large ballroom
on Wednesday.  This was due to another failure on the part of the hotel as
they had "accidentally" given rooms we were contracted for to another group.
At first the thought was that I could probably just ignore the other room
and not provide access, then I was told that [Lessig's](http://www.lessig.org/)
talk would be in the new room.  Joy.






So, it went from being a very easy job to a rather difficult job.  I now needed
to plan a full network for 500 people in about four days.  Did I
mention I was really annoyed with the hotel by this point in time?
Well, if not, I was.






So, I got a hold of Jim on Saturday afternoon to discuss what we
should do.  The decision was made to give me the go ahead to purchase
whatever else I needed.  I estimated that on the low end I would need
about $700 worth of equipment to do the job and that on the high end I
would need about $2000.  It's hard when you can't say what the power
of the wireless signals will be or if you're going need to buy a
computer to serve as a DHCP server or not.






I ended up just upping my original order a little bit.  I had
originally planned to order about 1000 feet of cable to wire whatever
I really needed to wire, along with a crimper and some heads.  I also
had already planned on getting four WRT54Gs and using those for the
bandwidth upstairs.  I just upped the order by three and picked up a
total of seven WRT54Gs.  In addition I ordered a 16 port wired switch
for the Internet room.  Total bill for all the equipment (cable,
crimper, heads, WRT54Gs, and switch) was just under $800.  I went with
CDW because they were local and if stuff started blowing up they had
same day delivery in downtown Chicago.  Plus, it wasn't my money so I
wasn't concerned about saving $3 a router by going with some obscure
website I had never heard of.






I arrived on Saturday morning and found that the equipment had arrived
without any difficulties.  Everything was there in nice little boxes.
Shortly after lunch time the tech from the hotel met me and we went to
turn on all of the internet jacks in each of the rooms.  Brian, the AV
chair went with me to make sure everythin went smoothly and to ensure
I remembered where everything was.  That afternoon I set up the
internet room.  I used two WRT54Gs for the room.  One was the primary
connection and the other just served as a switch/access point.  They
were put on two different frequencies, away from the Hilton's
channels.  I also made the decision to use the custom [Sveasoft](http://www.sveasoft.com/) firmware.  I'm not big on
the fact that the guy behind it seems to be a dick, but I run an old
version on my router and it seems to work well.  This just worked, no problem at all, it seems like everyone
was able to utilize everything just fine.






The next day I set up everything in the ballrooms downstairs.  I had
originally planned on doing one wireless network with a central DHCP
server that I would have to purchase.  However, due to Chicago fire
code, I was unable to do this as we'd have ethernet cable running
across a doorway or two, which is verboten in Chicago.  Instead I made
three different networks, each with a different SSID and on a
different channel.  Fearing that I would run out of IP addresses, I
limited the leases to 45 minutes.  Later this would come back and bite
me in the ass.






On Monday the conference began.  It was not pretty.  While some people
could get on the network just fine, others were having a horrible
time.  There were a couple of reasons that first day.  One reason was
just bandwidth.  I hadn't blocked any services.  I did a little bit of
sniffing on the network and found that there were people doing
streaming video and BitTorrent.  At a conference you just can't have
this sort of thing going on.  Luckily, the firmware has a layer 7
packet classifier that is able to block just those services without me
blocking the ports.  This helped out considerably.






But we still had the problem with people not being able to get IP
addresses.  It seemed like going up to the machines and rebooting them
"fixed" the problem.  In the sense that it allowed people to get IP
addresses, but it also sometimes caused address collisions.  People
seemed okay with the network at this point, but they weren't happy.  I
decided to lower the lease time on the addresses, thinking that may
have had something to do with it.  So I dropped the time to 15
minutes, this only made the problem worse.  Sigh.






I didn't get the problem figured out on Monday.  I could still
associate with the access points if I gave myself a static address,
but this was not practical for everyone.  Just to make sure that [Messyboard](http://www.messyboard.org/) kept running, I ran a
200 foot ethernet cable to Adam's display and gave him a couple of
static addresses.






Tuesday rolled around and I was able to pinpoint the problem down to
the DHCP server on the WRT54Gs dying.  There was pretty simple
solution to this, just put something in cron to automatically restart
the DHCP server.  The problem is where to put it.  Entries that were
put in crontab just seemed to disappear at random, they were not
reliable.  I found I could write a script and place the cron entry in
/etc/cron.d and that would do the trick.  However, if the machine was
rebooted then I would loose the script.  I made a copy of the script
on my disk and proceeded to put it on each of the machines.  It
worked like a charm.  I also realized that to minimize traffic on the
DHCP server I should put the lease time at 2 hours, as the is the
amount of time between sessions.  Important note for conference
planners, put your lease times at the length of time of the sessions
and no less.






Wednesday proved to be my biggest challenge.  There was session on
backchannel communication in the morning that [Joe](http://www.interrelativity.net/) asked me to attend to
make sure everything worked fine.  I arrived down there early in the
morning to drop another access point in the room.  Both were set to
restart the DHCP server every 5 minutes.  Overall the backchannel
session worked like a charm.  The presenters were all in the
backchannel as were many people in the audience.  The two access
points were serving 120 different wireless devices at the same time
(70 on one, 50 on the other).  Yes, these little boxes kept going
after I fixed the DHCP issues.






The backchannel session was the most stressful, but also the most
rewarding.  After a while, I just stopped watching the routers because
I become comfortable in knowing that they were going to keep on
working.  Instead I just started searching for naughty pictures to
make [Liz Lawley's](http://mamamusings.net/) instance of
EtherPeg show funny stuff on the projector.






If I had it to do over, I would make a few changes.  First, I would
definately find a way to wire all the access points together.
Originally, this had been a possibility for us if I would have gotten
one of the wedge things that your put in a doorway and run cables
under.  This would have made everything much more seemless.  This
would have also required a computer to manage all the addresses.  A
little box from [Soekris](http://www.soekris.com/) would
probably do the trick.  This would also allow me to create a larger
subnet, so I wouldn't have to worry about running out of addresses.
However, because we had to move upstairs on Wednesday, and thus the
conference was split between floors, this turned out to be a
non-option anyway.






The other thing I would do is give more thought to backchannel.  Most
importantly, mandate compensation for [FreeNode](http://www.freenode.net/) as part of the deal.
They are great folks and really helped us out a lot.  Secondly, get a
bot that is able to post the logs and an archive of the links on a web
page.  Lots of people have asked for the logs, which have [been posted](http://patrick.wagstrom.net/research/cscw/) to
my webpage.  I'm not entirely sure about the need for a wiki during
the conference, but post conference, it seems like it would have been
helpful.  During the conference it was great to have Messyboard
running in a highly visible location.  I can't stress that enough.






Finally, one last thought is that it might be nice to have a [Planet](http://planetplanet.org/) style weblog aggregator for
people who are blogging at the conference.
