e--
title: "Coventry, CT Internet Service Providers"
name: "isps"
type: "page"
menu: "main"
---

BALH
Coventry, CT Internet Service Providers
=======================================

Summary: **The best internet service provider for most people in Coventry, CT is Frontier fiber optic.**

I've decided to put this article together because one of the most common
questions on town Facebook groups is about internet service providers. When I
moved to Coventry in 2013 there was only one real choice for high speed
internet, Spectrum. Today, you've got a number of different choices. As I get
more information, I'll update this page with more details.

| Provider | Plan | Upload Speed | Download Speed | Monthly Price| 
|----------|------|--------------|----------------|--------------|
| Frontier | 500/500 Fiber | 500mbit | 500mbit | $39.99/mo for 3yrs |
| Frontier | Gig Fiber | 940mbit | 940mbit | $69.99/mo for 3yrs |
| Frontier | 2 Gig Fiber | 2000mbit | 2000mbit | $129.99/mo for 3yrs |
| Spectrum | 100 mbit | 100mbit | 12mbit | $74.99/mo |
| T-Mobile | Home LTE | 50mbit | 50mbit | $50.00/mo ($30/mo for some T-Mobile customers) |
| Verizon | Home LTE | 50mbit | 50mbit | $50.00/mo ($25/mo for some Verizon customers) |
| SpaceX | Starlink | 100mbit | 20mbit | $110.00/mo |

This does not, and will never cover traditional satellite systems like
HughesNet and Viasat, legacy DSL systems, or dialup (which still exists). These
options have such bad performance that you'd have to be really desperate, and
with these other choices, you don't have to be that desperate.

A Word of Warning
-----------------

Often times people write asking for suggestions about a new ISP because they
think their ISP is "bad". In most cases, if your ISP is continually "bad" then
it is likely the equipment you have in your house. WiFi standards continue to
evolve and [the average home had 25 internet connected devices as of
2021](https://www.telecompetitor.com/report-connected-devices-have-more-than-doubled-since-2019/),
which is more than double the 11 devices they had in 2019. If you're still
rocking the same wireless router you bought during the Obama administration,
you may want to upgrade to a newer and potentially more powerful system.

From my own analysis over the past year, Spectrum, which had been the best
choice for ISP in Coventry, had less than two hours of downtime at my house.
That's not to say there won't be other problems, but in general, ISPs are very
reliable. Please note, this was prior to the rollout of Frontier Fiber in Coventry.


Frontier Fiber
--------------

Frontier's new fiber service is the new kid in town, just becoming available in
June 2022 after being announced in July 2021. Frontier is aggressively rolling
out fiber to most areas in town and you might've seen their trucks on your
street. Once your street is avaialble to get fiber, you'll get a door hangar
dropped by your door. From there you can sign up online or by calling them. I
signed up online, it was quick and probably easier than calling.

Frontier has three different plans - all of which provide symmetric bandwidth:
500mbit, 1000mbit, or 2000mbit. Pricing is $39.99, $59.99, and $129.99. Every
one of these services [provides far more bandwidth than most households
need](https://www.fcc.gov/consumers/guides/broadband-speed-guide). In addition,
the hardware within most households cannot support these speeds - even the
slowest 500mbit. But, if you do have the hardware to support it, and I do, the
speeds are phenomenal. What's even better is that not only do you get ultra
high speeds, but you also have very low latency. This makes video calls and
online games a lot more zippy.

Installation is fairly straightforward, although it generally takes longer than
Frontier says it will take, so try and schedule a morning slot and hope they
arrive by noon. My home installation was much easier than most and it still
took about two hours. The first thing the tech will do is fine the pole in your
neighborhood to connect to. This may not be the pole nearest to your house - in
my case it's the pole on the far end of my neighbor's property. From there, the
technician will spool out "hard fiber" from the pole to your house. If you ask
they can keep this coming in with all the other utilities in your house. Also,
it's obviously much easier if you've got above ground utilities.

This "hard fiber" connects to your house in an outside junction box where the
hard fiber joins the thinner, more flexible fiber for the short run into your
house. Once inside your house, the fiber connects to an optical network
terminal (ONT), which you can think of as a little like a cable modem. The ONT
has a 10 gigabit ethernet port and MOCA connectors if you need to move the
connection via coax somewhere else in your house. You're best off if you can
run ethernet directly to your router. Frontier will _really_ push to have you
use either the Eero mesh wifi system or to get high speed router manufactured
by Arris. If you're certain you know what you're doing and you already have a
high end router at home (Unifi UDM-Pro, Amplifi, TP-Link Omada, Eero, Google
Mesh, etc), you can probably convince the installation tech to let you plug the
ethernet from the ONT directly into your router. Do this and you'll be much
happier.

Contrary to what you may see if you look on Reddit or DSL Reports, the ethernet
coming out of the ONT is plain old ethernet. There's no need for crazy
`wpa_supplicant` dance routines, VLAN tagging, or strange 802.1x options.
Coventry has their newest buildout and it's dead simple to use.

Thus far, I've been very impressed with the speed of Frontier, but they do have a poor
reputation and have gone through multiple bankruptcies. Fortunately, [Frontier
has been hiring a handful of high level execs from
Verizon](https://www.nexttv.com/news/former-verizon-exec-stratton-to-become-frontier-executive-chair-after-chapter-11-emergence)
to compliment their shift to entirely US based workforce. I consider this to be
a very positive sign for the company and makes me hopeful.

The other downside is that their network does not appear to support IPv6,
whereas Spectrum makes this easy. I'm still looking into an easy solution for
that. For most people IPv6 does not matter. There were a few edge things I was
doing with it that I'd like to have working again. For most people, you'll
never notice this is an issue, but for techies this might matter.

This service is best for:
* Most customers in Coventry

Spectrum
--------

Spectrum, which is the brand name for internet and television services from
Charter Communications, had been the best option for Internet in Coventry.
Their standard plan provides 100mbit downstream and 12mbit upstream for
$74.99/mo. There is no fee for a modem but there is also no discount for
providing your own. New customers often get discounts to their service plan
that time out over 12-24 months.

In reality, 100mbit with 12mbit upstream is enough for most families. You
should be able to stream four 4k video streams at once. You'll have plenty for
video conferencing too. I'm a heavy user of internet services as I work in
technology and I work from home, and this has been fine. The biggest downsides
are the price and upload speeds.

Since Frontier moved into town, people have reported being able to negotiate
their Spectrum bills down to $50/mo for 300mbit speeds. I have not personally
tried this, so I cannot confirm.

This service is best for:
* Customers who cannot get Frontier Fiber at their address
* Some existing Spectrum customers who are able to effectively bundle their TV/Phone/Internet
* Good negotiators who can get their price down

Starlink
--------

[Starlink](https://www.starlink.com/) sounds relly attractive, but it comes
with a number of caveats. First, there's a long wait list and the equipment
costs $599 on top of the $110/mo you'll pay for service. Second, you need a
clear view of the sky - not just in one direction, but in many different
directions. Third, the equipment is power hungry, particularly in winter expect
it take about 100W of power on average - which means you an expect to pay
$175/year just for electricity at current Eversource rates.

As far as the service goes, Starlink uses thousands of small satellites in low
earth orbit. These are launched on SpaceX rockets and cover wide swaths of the
earth with internet. However, that doesn't mean that you can just sign up and
get it next day. The satellites have bandwidth limitations that cannot be
easily upgraded because they're floating around in space. But, when compared to
older satellite technologies like HughesNet that use a few geostationary
satellites, you get a much better experience. [Speeds are on par with the most
common Spectrum plan, but at higher
latencies](https://www.ookla.com/articles/starlink-hughesnet-viasat-performance-q4-2021).
The latencies are still low enough that you can do video conferencing, although
it might start to make an impact for many online games.

Unless you've got no other choice, or you can't get a fixed broadband solution
and need more downstream than what T-Mobile LTE or Verizon LTE provide, you're
better off with other solutions for broadband in Coventry, CT. However, there
is one case where it might make sense. If you've already got a setup that makes
your home highly resilient to storms - which usually means a whole house
generator or Powerwalls that allow to operate off grid, then this could be
useful as a backup. When Tropical Storm Isaias hit Coventry in August 2020, the
damage was so severe that, not only were the ISPs knocked out, but so was almost
all mobile phone service. Verizon actually rolled as SPOT satellite uplink to
Coventry for a few days ([here's a picture of these
devices](https://www.verizon.com/about/news/media-resources/attachment?fid=5d681eb82cfac2436dc1f104).
So, **if you're a prepper, it might make sense to have Starlink as a secondary
ISP**.

Of note, [Starlink recently created their RV
plan](https://www.starlink.com/rv), which lets you activate the service one
month at a time for a higher price of $135/mo. If you can afford the equipment,
this option could let you have the equipment as a non-powered backup and only
activate it during a disaster. Of course, you'd need to get someplace to
activate it, but even during a major disaster in Connecticut, you never have to
go more than a few towns away to get wireless service.

This service is best for:
* People for whom there is no other reliable broadband internet option
* A backup for extreme preppers who absolutely cannot loose connectivity and
  already have a standby generator/battery to keep things going.

T-Mobile LTE
------------

T-Mobile has been aggressive in providing fixed wireless internet and it is
avaialble in Coventry, although speeds and performance aren't amazing. In
general, they lump all their options under the banner of [T-Mobile 5G Home
Internet](https://www.t-mobile.com/home-internet). This service works best in
areas where you already have great T-Mobile coverage. Specifically, if you have
a view of the tower over by town hall and can place the T-Mobile router by a
window with a view of the tower, then you'll get the best coverage.

As with any wireless service, it's a bit easier to experience congestion on
these services, which will result in slow downs. In general you should expect
to get about 50mbps down and 50mbps up with this service.

This may prove to be a more reliable option after storms than some other
options, particularly if you live in an area where lines get knocked down all
the time. However, after 2020's Tropical Storm Isaias, all wireless coverage in
the town was knocked out too.

Finally, this is very different than tethering your devices to your phone. This
solution is designed to be a primary home internet solution that is on all the
time. You do not have bandwidth limits when using this service and you don't
have to manually turn tethering on to make it work.

This service is best for:
* Existing T-Mobile subscribers who do not need high bandwidth and low latency. For those people the price point is attractive.
* Price sensitive customers who cannot get Frontier Fiber's $49.99/mo 500/500 plan.
* People who wish to have a backup service should their fiber or cable connection go down.


Why Not This, or That?
----------------------

There's lot of other options out there, but I'm not evaluating them. Here's why for each one:

* **Mobile Phone Hotspot**: It may be tempting to use a mobile phone hotspot as
  your primary connection. Tethering is usually metered, which limits you to
  10-20GB of data a month. A single 4k movie streaming from Apple TV can be 20GB.
  Not to mention, you'd always have to turn on your hotspot, which becomes
  challenging as more and more devices have internet connections.

* **Dedicated Mobile Hotspot**: Most of these don't have unlimited data,
  although you might able to find a few grandfathered plans. These devices,
  sometimes called JetPacks, are often not designed to handle as many devices as
  the average household has.

* **Frontier DSL**: Although some locations can get 125mbit DSL from Frontier,
  most places in Coventry can only get 18mbit. Frontier is trying to shut down
  their copper network and this option will prove to be slow and frustrating.

* **Dial-Up**: Ughh. No.

