---
date: '2006-08-08T17:42:00-04:00'
old:
  layout: post
  oldcategories:
  - mythtv
  status: published
  timestamp: 05:42 PM Tuesday, August 08, 2006 EDT
  wordpress_id: '158'
oldtags:
- money
- mythtv
- power
- treehugger
slug: mythtv-power-consumption
tags:
- treehugger
- money
- mythtv
- power
title: Measuring Power Consumption in MythTV
url: /weblog/2006/08/08/mythtv-power-consumption/
---

Somehow I'm becoming a bit of a [treehugger](http://www.treehugger.com/). Either that or I'm just getting annoyed with how hot rooms in the house get as a when I have computers on all the time.  So, I set out to figure out how much power each of my computers takes to run and how much this power costs.  The easiest way way to measure these devices was with my handy [Kill A Watt](http://www.p3international.com/products/special/P4400/P4400-CE.html). A rather nerdy Christmas present from Kristina a few years ago (I asked for it).

To test each of the machines I hooked them into the Kill A Watt for an extended time period and watched the load of the machine at different times.  For multiple tasks on the machines I would read the Watts from the Kill A Watt and then look at the overall power usage over an extended period.  For the costs of electricity I used the price on my July 2006 statement from [Duquesne Light](http://www.duquesnelight.com/), which is about $0.10 per KWh.  At this rate, 1W on all year costs a little under a dollar.

So let's start out with dearly departed Scissors.  Unfortunately, I did the measurements on scissors a long time ago and since have given it away, so I couldn't get the same variety of measurements.  Scissors was a tiny K6-200 machine with 96MB of ram and a single Quantum Fireball 4.3GB hard disk.  It had no other disk drives, furthermore, the fans on the machine were broken.  Over a course of 100 hours, this machine consumed about 3.78KWh - an average usage of 38W, for a yearly cost of $32.58.

Next I monitored the power consumption of Igel, my current server machine.  This machine is a PIII-900MHz machine with a single 45GB drive, CDRW drive, and 768MB of RAM.  As this is a server, I didn't break the load down by category.  Over 1222 hours (yes, that's well over a month), the machine used 84.4KWh of power, for an average consumption of 69W and a yearly cost of $59.22.  The faster machine costs nearly twice as much as the older machine to power.

Next up I did two rounds of measurements on Spongebob, my MythTV box.  The first round of tests were done before the upgrade I gave it as a birthday present to myself.  At this point, Spongebob was an AMD Athlon 64 3500+ with 3 200GB hard disks, 1G of ram, a WinTV PVR 250, a pcHDTV HD-3000, and a DVD drive.  I should also mention that the northbridge fan was not working.  Over 96 hours the machine used 10.17KWh of power, for an average of 106W and yearly cost of $90.  When watching HDTV the consumption shot up to 130W - increasing the cost to $111.  Luckily, it's not watching HDTV that often.

Recently I upgraded Spongebob to a AMD Athlon 64x2 4400, 1 200GB hard disk, 4x320GB hard disks, 1G of ram, a WinTV PVR 250, 2 pcHDTV HD-3000s, and a DVD drive.  I also replaced the northbridge fan with a really fancy lanboy style cooler.  Initially, however this new configuration did not support CPU throttling.  The load was averaging about 165W making the cost $142.32.  Ouch.  That had to change.  Luckily, there's a way to fix this that involves hacking your kernel and your ACPI settings, but I'll cover that later.  When monitored over 97 hours the machine consumed 13KWh of power, for an average of 134W and a cost of $114.89. Watching HDTV put the usage back up to 165W, which left the $142.32 cost.  Overall, adding in the upgrades costs me about $25/yr in power costs, significant, but still the MythTV box comes out to less than $10/month.

For convenience, here's a chart showing some of the power costs:

<table>
    <tr><th>Machine</th><th>Avg W/h</th><th>Yearly Cost</th></tr>
    <tr><td>Scissors</td><td>38</td><td>$32.58</td></tr>
    <tr><td colspan="3">AMD K6 200, 4.3GB disk, 96MB ram</td></tr>
    <tr><td>Igel</td><td>69</td>$59.22</td></tr>
    <tr><td colspan="3">PIII 900, 45GB, 768MB ram, CDRW</td></tr>
    <tr><td>Spongebob</td><td>106</td><td>$90.83</td></tr>
    <tr><td colspan="3">Athlon 64 3500, 3x200GB, 1GB ram, DVD</td></tr>
    <tr><td>Spongebob</td><td>134</td><td>$114.89</td></tr>
    <tr><td colspan="3">Athlon 64x2 4400, 1x200GB, 4x320GB, 1GB ram, DVD</td></tr>
</table>

So what's this going to change?  I had no idea that running Igel was costing me $60/yr for just power.  Wow.  That's gonna make me do one of two things, either migrate the virtual machines down to the MythTV box, or purchase a cheapo shared server -- probably the former.  With that sort of change, our power consumption will be under the levels from when I had scissors as my server and the pre-upgraded Spongebob as MythTV (total consumption of 141W) as opposed to 134W now.  Still, I'm a little shocked at the power consumption of everything.  I wish I had an easier way to quantify the power consumption of individual components of the system.  If anyone knows of a way, short of ramming probes into the system, I'd love to hear it.