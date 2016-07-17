---
comments: true
date: '2012-12-04T14:25:00-05:00'
old:
  layout: post
  oldcategories:
  - scuba
  - computer
  status: published
  timestamp: 02:25 PM Tuesday, December 04, 2012 EST
oldtags:
- scuba
- uwatec
- irda
- mac
- hacking
- programming
- dc2uddf
slug: 30-meters-underwater-with-a-dead-physical-layer-protocol
tags:
- dc2uddf
- mac
- computer
- irda
- hacking
- programming
- uwatec
- scuba
title: 30 Meters Underwater with a Dead Physical Layer Protocol
url: /weblog/2012/12/04/30-meters-underwater-with-a-dead-physical-layer-protocol/
---

A couple of years ago I got the bright idea that I'd get my wife open water SCUBA certification as her Christmas present. She likes aquariums and fish and I thought it would be a fun way to do something different when we travel. Fast forward to the present day and I've got a closet filled with neoprene, BCDs, fins, first aid kits, and a dive log filled with all sorts of certification cards from PADI.

We purchased our own equipment relatively early in the process of learning how to SCUBA dive - shortly after getting our open water certification, thanks in large part to a nice tax rebate. For the most part we've been very happy with our purchases and I feel like it's made us much more comfortable when we're underwater. One of the key components of diving is a dive computer. The most basic dive computers tell you your depth and warn you if you're ascending too fast or are going to need a decompression stop somewhere along the way. More advanced computers replace your entire diving console and provide a compass and wireless integration of you and your buddy's pressure gauge. Yeah, we went for that kind of over the top dive computer and bought the [Uwatec Galileo Luna][galileo].

<div class="image caption center">
    <img src="/weblog/media/2012/12/galileo_luna.jpg" alt="Uwatec/ScubaPro Galileo Luna Hoseless Air Integrated Dive Computer">
    <p>Uwatec/ScubaPro Galileo Luna Hoseless Air Integrated Dive Computer</p>
</div>

I'll be the first to admit that this probably wasn't the wisest of ideas. I spent two weeks researching [$55 gel pads for my standing desk<img src="http://www.assoc-amazon.com/e/ir?t=twesixandtwo-20&l=as2&o=1&a=B003BYRDK2" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /> ][deskmat] and here we just decided to drop $2000 on a couple of dive computers thanks to thirty minutes at our local dive shop. We've been completely thrilled with them under water. Where we've had more problems is getting data out of them above water. More advanced computers also take periodic samplings of your depth, remaining air, water temperature, etc. You can use this data to reconstruct a dive profile in a way that much richer than what normally appears in your dive log.

<div class="image caption center">
    <img src="/weblog/media/2012/12/divelog.png" alt="Screenshot of jTrak - Does it feel like it's 1999?">
    <p>Screenshot of jTrak - Does it feel like it's 1999?</p>
</div>

Getting this data off your computer isn't trivial. Dive computers are
expensive for a couple of reasons: they're produced in relatively low
volumes, they often license patented algorithms for estimating your
air consumption and remaining bottom time, and, of course, they need to be waterproof. This
means that you can't just drop a USB port on the outside of the
case. Nor can you just put a USB port under a rubber flap. At 30
meters you're facing about 400kPa of pressure - four times the
pressure at the surface. Water will find a way in. If it gets in the
salt will corrode everything and it will die. Thus, dive computers
tend to be very well sealed and make even trivial things like changing
the battery a process that requires tools and new grease for the
O-rings.

There really isn't a standard interface to these devices. It seems as
though a lot of devices, such as the [Mares puck computers][puck], have
corrosion resistant metallic contacts that connect to a USB controller
with an FTDI USB&rarr;Serial chip in it. However, the Uwatec Galileo
decided to be more advanced and use what I'm sure was the hip
protocol at the time: IrDA.

Now, in case you missed it, IrDA was all the rage in the 1990's and
early 2000's. Every laptop seemed to ship with an IrDA port built
in. You could use it to synchronized data with your Palm or Handspring
in the late 1990's. Once cell phones were more common you could even
tether your laptop to your cell phone and get very slow data. In the
pre-wifi, pre-edge days this was pretty hot stuff. "Was" being the key
word. Hot stuff being around the speed of the 28.8k modem that I used
when back in 1994.

You can still find devices that use IrDA, most notably a lot of the
[heart rate monitors from Polar][polar], but for the most part the technology
is from about 10 years ago. This also means that you're dealing with
the headaches of 10 years ago, including the near total lack of Mac
support for devices. Those that do support the Mac often only support
the PPC Mac and never really fully supported it anyway. Did I mention
that MacOS X doesn't even have full support for IrDA? Just try opening
up a socket using `AF_INET`. It doesn't exist. Ughh. This was going to
be a great adventure.

Setting Baseline Expectations
--------------------------
My first naive attempts were to hack an IrDA driver into the framework
of [libdivecomputer][libdivecomputer]. There was already support for IrDA
dive computers under Windows and Linux, and I had confirmed that they
worked just fine with my my computer, how hard could it be? The answer is
a lot more complicated than I thought. The first step was to find an
IrDA dongle that even worked with Mac OS X. I ordered a couple of cheap
ones off eBay and had no luck. I read a few comments from folks saying that
the official [Uwatec USB->IrDA devices][officialIrDA] worked with [JTrak][jtrak] on Mac OS X, however
the official dongles about $70 and JTrak is a bit less than what I'm looking for in a
dive logging software. Fortunately, I was able to find another device that looked nearly identical from the outside - the [IRJoy USB 2.0 USB IrDA adapter][irjoy] for $30. When this guy arrived a quick scan showed that it was the exact same hardware as the official Uwatec dongle - both were based on the MosChip 7780 chipset.

Plugging the device into my trusty Thinkpad x31 showed that it quickly and easily worked both in Windows and Linux using the SmartTrak software from Uwatec, JTrak, and the test applications from libdivecomputer. I knew that I could at least make some progress. Next up was to test it on my Mac. I plugged in the IrDA stick and fired up JTrak and to my amazement it just worked. That NEVER happens. Poking around showed why it worked, the company behind JTrak had licensed a complete pure Java IrDA stack. Well, at least I could use JTrak if everything else failed. However I had my eyes set on something much prettier, [MacDive][macdive].

Writing a Driver
----------------
I had heard people refer to the fact that the MosChip devices had a Mac driver, but most of those conversations ended many years ago &emdash; as if I needed more evidence that I was dealing with a dead protocol. After some digging around and emailing random customer service addresses I found that the IP for the MosChip devices were sold off to a company in Taiwan called Asix. They provided a couple of different versions of the driver and I eventually found one that worked in full 64 bit mode on Mac OS X Lion. Score.

The driver came with a simple test application that would let me read the data coming over the device as though it was a serial device. Using this test application I was able to position the reader in the line of sight of other IrDA devices and receive data. Neat. The problem is that I was getting the raw bytes of the IrDA sockets. There's a lot of overhead in there that goes along with handshaking, setting speed, and resending data when connections are interrupted. None of this seemed to be enabled in the driver. The driver simply provided a couple of serial devices that I could open up and use to smack bits back and forth. If I wanted this to work I would need to write a complete IrDA stack on top of this serial device.

The problem is that the [IrDA stack is actually fairly complex][wikipediaIrda]. Theres's a myriad of different protocols that stack on top of IrDA to make everything work. This was basically the equivalent of trying to implement TCP/IP using just the raw bits coming over the 802.11 physical layer. In other words, it was a nasty layer mismatch that was not going to do me any favors.

<div class="image caption center">
    <img src="/weblog/media/2012/12/irdaStack.png" alt="The Multifaceted IrDA Stack - From Wikipedia">
    <p>The Multifaceted IrDA Stack - From Wikipedia</p>
</div>

I continued to email Asix, who were more than helpful, although they seemed most concerned that I would write a driver that would let the user transfer files with Windows and cell phones. After a few more emails I explained was a dive computer was and how much of a niche this issue was and Asix offered me an NDA to work on the driver
and attempt to implement the `AF_INET` stack for Mac OS X. If I were in
undergrad this would probably sound like a great idea. However, I'm not.
I've got a job that keeps me quite busy and has me flying back and forth
between New York and Washington on a weekly basis. I just don't have the
time to acquire the knowledge needed to hack together a driver on Mac OS X.
Of course, there's also the issue of me performing gratis work for a
for-profit company, which I didn't really want to do either.

VMs to the Rescue
-----------------
This left me with really only one simple solution, use what I know
already works for communicating with the Galileo Luna, Linux or Windows.
In an effort to keep this simple and avoid worrying about license issues
I chose to use a very minimal Linux installation under VirtualBox as my
guest environment. The next problem was the software to make use of my
data. There were a couple of different ways to handle this, either do
all of my log work inside of the virtual machine, or just download the
data in the virtual machine and copy it over to my Mac to do most of the
work on the log. Starting up a VM is a bit of a pain, so the choice was
made to use mac dive log software and download the data in the VM then
copy it over.

There are a couple of different formats that might be able to fit the bill, SDE, UDCF, UDDF, and ZXL. SDE is the output format from Suunto Dive Explorer software. There doesn't appear to be much documentation for the format, but it supposedly contains all the necessary information that a diver might want to recreate a dive log on a computer. Supposedly [Subsurface][subsurface], a dive log software package by Linus Torvalds, can import from SDE, so there should be some source code there that I just haven't had a chance to dig at yet. ZXL is a format designed by DAN to collect information for scientific studies of diving related injuries. [UDCF][udcf] and [UDDF][uddf] are formats developed by a group of interested divers that seem to achieved moderate success. UDCF can be considered to be the little brother to the more robust UDDF. Many tools support UDCF, but it lacks official mechanisms to do things like save the pressure in a tank.

The most promising format seems to be [UDDF - the Universal Dive Data Format][uddf]. UDDF, like most interchange formats, sadly uses XML so it is parseable by neither humans nor machines. It is able to contain information about dive profile, temperature, and air usage, which are the main things I want to track. I wasn't able to find a tool that used libdivecomputer to produce a UDDF file, so I wrote my own, the cleverly named [dc2uddf][dc2uddf].

dc2uddf is a simple tool that uses [libdivecomputer][libdivecomputer] and [libxml2][libxml] to download data from a dive computer and save it as a UDDF file. That's all it does. There isn't much of a user interface, but it works, and it's written in C, which makes me feel a little more like a programmer than I normally do. I'm certain there are some things that it is doing incorrectly, if folks discover problems email me or [file issues on github][ghissues] and I'll be sure to fix them. Along the way I've also found several defects in the UDDF standard, so I feel like I'm making the standard better too.

Now I'm at the point where I can download the data using a Linux VM and then
copy the data over to my Mac where I can easily import it into the excellent
[MacDive][macdive] software, as you can see below.

<div class="image caption center">
    <img src="/weblog/media/2012/12/macdive.png" alt="The Pretty-Pretty Output of MacDive">
    <p>The Pretty-Pretty Output of MacDive</p>
</div>

The Future
----------

I've thought about a couple of ways that I could make this a bit more streamlined. The current candidate is to get a [Raspberry Pi][raspberrypi] board and create a small dedicated device for downloading dive computer data. Basically you'd turn it on, put the dive computer within range, press a button on the case for the Raspberry Pi and your data would be automatically downloaded. You could feed it an SD card and it could either use the configuration file on the SD card to upload the data to a remote host or just store a copy on the SD card. However, given the long waits for Raspberry Pis at the current time and my busy schedule I'll just have to wait on that idea.

I've also toyed with the idea of making a service that provides real analytics on dives. Right now there are a couple of different sites that allow you to share dive logs. [DiveBoard][diveboard] seems to be the most cross-platform of sites and they've even developed a browser plugin based on libdivecomputer to automatically upload your dives from your browser. Aside from their plugin they allow users to upload UDCF, SDE, and ZXL files. They've even gone so far as to extend UDCF to allow for pressure information &mdash; although this seems to be a clear sign to me that they should consider allowing UDDF uploads.

Another community is [Suunto Movescount][movescount]. This is the successor to Suunto's Dive Explorer software and reflects the fact that they've moved beyond just diving metrics. The problem is that as near as I can see it's a locked platform. There doesn't appear to be any way to get your data out of it, or, for that matter, get data from non-Suunto devices into it.

Both of these sites are missing some of the potential for such sites, which is the ability to measure and track rather than just keeping a log. It's something that sites like [RunKeeper][runkeeper] are just beginning to explore with efforts like their FitnessReports, but even those reports are rather cursory. There's a number of metrics that we can calculate both on an individual and across a community that would be highly beneficial to everyone involved - divers, dive shops, travel agents, tour operators, and gear manufacturers, to name just a few. However, the description of these analytics will have to wait for a future post.

[polar]: http://www.polarusa.com/
[puck]: http://www.mares.com/products/computers/wrist-computer/puck-wrist/371/?region=us
[libdivecomputer]: http://www.divesoftware.org/libdc/
[dc2uddf]: https://github.com/pridkett/dc2uddf
[uddf]: http://www.streit.cc/extern/uddf_v310/en/index.html
[macdive]: http://www.mac-dive.com/
[officialIrda]: http://www.scubapro.com/en-US/USA/instruments/computers/products/usb-infrared-interface-(irda).aspx
[jtrak]: http://www.frobese.de/jtrak/en/jtrak.html
[irjoy]: http://www.amazon.com/gp/product/B004FEQ9UW/ref=oh_details_o05_s00_i00
[wikipediaIrda]: http://en.wikipedia.org/wiki/Infrared_Data_Association
[udcf]: http://www.streit.cc/dive/page17/page15.html
[diveboard]: http://www.diveboard.com/
[movescount]: http://www.movescount.com/
[raspberrypi]: http://www.raspberrypi.org/
[deskmat]: http://www.amazon.com/gp/product/B003BYRDK2/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B003BYRDK2&linkCode=as2&tag=twesixandtwo-20
[galileo]: http://www.scubapro.com/en-US/USA/instruments/computers/products/galileo-luna.aspx
[gh-issues]: https://github.com/pridkett/dc2uddf/issues?state=open
[libxml]: http://www.xmlsoft.org/
[subsurface]: http://subsurface.hohndel.org/
[runkeeper]: http://www.runkeeper.com/