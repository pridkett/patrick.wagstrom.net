---
date: '2007-03-20T11:59:00-04:00'
old:
  layout: post
  oldcategories:
  - code
  status: published
  timestamp: 11:59 AM Tuesday, March 20, 2007 EDT
  wordpress_id: '280'
oldtags:
- administration
- nvidia
- python
- sensorgraph
- sensors
- smartmontools
- system health
- web
slug: monitoring-your-system-with-sensorgraph
tags:
- smartmontools
- code
- web
- python
- administration
- nvidia
- sensorgraph
- sensors
- system health
title: Monitoring your system with SensorGraph
url: /weblog/2007/03/20/monitoring-your-system-with-sensorgraph/
---

One important aspect of keeping a computer healthy and happy is monitoring its vital stats.  This is especially true of systems that are on 24/7 or that don't have a traiditional mode of user interaction.  In my case, my MythTV box fits both of these qualities.  In particular, it's important to make sure that the fans are running and none of the drives or processors in the machine are running abnormally hot, as this could indicate a malfunction within the machine and should be looked at.

Linux provides a multitude of methods to get at various sensor information on your computer, the most common method is with the lm-sensors package. This suite of tools interacts with various sensors that are built into most every piece of x86 compatible hardware.  Typically you'll just use the command sensors to get a status list, such this listing from my MythTV box:

    w83627thf-isa-0290
    Adapter: ISA adapter
    VCore:     +1.09 V  (min =  +1.94 V, max =  +1.94 V)       ALARM
    +12V:     +12.40 V  (min = +10.82 V, max = +13.19 V)
    +3.3V:     +3.14 V  (min =  +3.14 V, max =  +3.47 V)
    +5V:       +4.93 V  (min =  +4.75 V, max =  +5.25 V)
    -12V:     -12.11 V  (min = -10.80 V, max = -13.18 V)       ALARM
    V5SB:      +4.97 V  (min =  +4.76 V, max =  +5.24 V)
    VBat:      +2.94 V  (min =  +2.40 V, max =  +3.60 V)
    fan1:        0 RPM  (min = 5075 RPM, div = 2)              ALARM
    CPU Fan:  2812 RPM  (min = 2636 RPM, div = 8 )
    fan3:     5037 RPM  (min = 61363 RPM, div = 2)              ALARM
    M/B Temp:    +37°C  (high =  +111°C, hyst =   +72°C)   sensor = thermistor
    CPU Temp:  +25.5°C  (high =   +80°C, hyst =   +75°C)   sensor = thermistor
    temp3:     +10.5°C  (high =   +80°C, hyst =   +75°C)   sensor = diode
    vid:      +0.275 V  (VRM Version 9.0)
    alarms:
    beep_enable:
              Sound alarm enabled

The top little confusing string just indicates what sensors interface the program is using.  Beneath that is a listing of sensors and their current values, you'll notice that there are measurements for all of the voltages from your power supply, fan speeds, and motherboard and cpu temperatures.  It may take a little looking to figure out what all of these mean and why some of them may not have have values that intially make sense.  For example, I only have two fans on my system, the CPU fan and northbridge, which is why it says 0 RPM for the value of fan1.  I've also noticed that the voltage tends to get confused by powernow setups, especially when you've gone through and [modified your DSDT table to save some extra power](http://patrick.wagstrom.net/weblog/linux/custom-powersaving-kernel-for-profit.xml).  Ensuring that these values are nominally appropriate is a key element for computer health as if the voltages sway too much they can cause interference with the PCI bus, as was my problem with pcHDTV cards and the original Antec power supply in my Antec Overture II case.

While the lm-sensors package monitors lots of things, there are many other sensors in your system that don't have such a uniform interface.  For example, you the nvclock application can provide a wealth of knowledge surrounding [nvidia](http://www.nvidia.com/) video cards.  Here's a snippet of what you can expect from running nvclock -i:

    -- General info --
    Card:           nVidia Geforce 6600LE
    Architecture:   NV43 A4
    PCI id:         0x142
    GPU clock:      9.705 MHz
    Bustype:        PCI-Express

    -- Pipeline info --
    Pixel units: 4 (10b)
    Vertex units: 3 (111b)
    HW masked units: pixel 01b vertex 000b
    SW masked units: None

    -- Memory info --
    Amount:         256 MB
    Type:           128 bit DDR
    Clock:          12.846 MHz

    -- Sensor info --
    Sensor: GPU Internal Sensor
    GPU temperature: 52C

    -- VideoBios information --
    Version: 05.43.02.69.02
    Signon message: GeForce 6600 LE BIOS
    Performance level 0: 300MHz / 400MHz

Not only does it correctly identify the exact video card you're using, but it also provides information about the performance levels and clock rates the card is running at.  Here we see that when my monitor is off, as it was when I ran this, the card slows itself down to conserve extra power.  We also see that the interal GPU temperature is 52C.  This is a little bit of a concern, but should be taken lightly as the card is a first generation fanless GeForce 6600 and has a fairly poor heat sink.  It frequently overheats in games like Quake 4.

Not to be left out, hard drives also have an amazing amount of information available at your finger tips.  Almost every IDE or SATA hard drive out there is compatible with SMART, which is an automated tested and analysis system for hard drives.  Up until last month, it was widely thought that temperature and usage loads were high correlated to drive failure, however thanks to some clever research out of [Carnegie Mellon](http://www.cmu.edu/), we've seen that for the most part [failure rates grow with time](http://www.usenix.org/events/fast07/tech/schroeder.html) and have little to do with other parameters.  Folks from Google published a similar paper in which they looked at [drive failures across a large enterprise](http://www.usenix.org/events/fast07/tech/pinheiro.html) and found consistent results.  Now it just means that we can make nifty graphs and re-evaluate if we need more fans in our systems.  Anyway, the [smartmontools](http://smartmontools.sourceforge.net/) package is a great set of tools that monitors drive parameters and can automatically alert you if a drive is going bad.  Of course, I've had drives that smartmontools was complaining about for years that kept on working.

Now that you know how to collect all this information, wouldn't it be nice if it were done automatically and stored in a database with a nice web interface?  Yes it would.  That's where SensorGraph comes along.  SensorGraph is a python script that reads the values of all of the sensors and stores them into a database for further analysis.  I typically run the program once every fifteen minutes.  Then to look at my system, I created a web interface to SensorGraph that utilizes [GNUPlot](http://www.gnuplot.info/) to create some SVG graphs for visualization of trends.  Throw in some nice javascript interface, and you've got yourself a nice little setup to look at your system.  If you'd like to get a copy of SensorGraph, you can check it out from my subversion at [https://secure.wagstrom.net/svn/projects/sensorGraph](https://secure.wagstrom.net/svn/projects/sensorGraph). If you'd like to see a demo of sensor graph's web interface, I've put up a [small demo site](http://patrick.wagstrom.net/misc/test.cgi) that uses some static information from my MythTV box.  I would have a live information setup for my web server, but it's a virtual machine, so most of the sensor interfaces aren't present or return garbage information.

Using all of these tools, I can quickly look at the health of my drives and CPU and tell if something is going wrong.  It also provides a nice reminder of what days were warmer because I can see days that the CPU was typically warmer, indicating that it was probably warmer outside.  Not entirely practical, but perhaps helpful.  In the future I'd like to add the ability to calculate some trend lines and a sliding window for the graphs to better get an idea of the health of the machine.