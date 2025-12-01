---
title: "Using IrDA to Download from a Uwatec Galileo Luna on an M Series Mac...in 2025"
date: 2025-08-05T09:56:59-05:00
slug: using-irda-to-download-from-a-uwatec-galileo-luna-on-an-m-series-mac
draft: true
url: /weblog/using-irda-to-download-from-a-uwatec-galileo-luna-on-an-m-series-mac
tags:
- linux
- macos
- irda
- scubapro
- libdivecomputer
- retro
---

More than a decade ago I wrote a weblog article on getting some support for
Uwatec Galileo Sol dive computers into modern dive log software. That was back
in 2012 and here we are in 2025 and IrDA is deader than a doornail and I still
have the same dive computer. After a recent dive trip, I decided to see if my
old project, dc2uddf, still worked and if I could actually download dives and
bring them into Subsurface.

First, let's talk about UDDF - it's an XML based format for dive log
information. It never had a real proper webpage, and way back in 2018, the
domain uddf.org stopped serving pages, instead redirecting to one of the
developer sites. There are now two developer sites - [one from Steffen
Reith](https://streit.cc/dive/page2.html), which appears to have the most up to
date specification, and [one from Artur
Wroblewski](https://wrobell.dcmod.org/uddf/), which if you're lucky is where
https://uddf.org/ will redirect you to on a good day. The format hasn't been
substantially udpated since 2018, but you can find the [latest specifications,
which is version 3.2.3, on Steffen Reith's
site](https://wrobell.dcmod.org/uddf/). It appears that Artur Wroblewski is now
working on an [expanded format called UDDO, which brings in additional semantic
web ontologies](https://gitlab.com/wrobell/uddo/). I'm going to stick with UDDF
here, because I might almost remember it from 2012.

Next, you're going to need a USB IrDA dongle and USB-C to USB-A adapter to make
this work on your shiny Mac. These things used to be dirt cheap, but now that
almost no one is using them, expect to pay $70+ if you can find the official
ScubaPro/Uwatec dongle based on the Moschip 7780. I have one somewhere, but I
couldn't find it. Rather I found a really cheap Kingsun KS-959 adapter that
worked for me. Even these cheap adapters are still like $50 if you can find
them.

MacOS hasn't supported IrDA in a long long time, and it never really did a good
job with IrDA and libdivecomputer. Even in 2012, I was using a virtual machine
to make it work, but at least back then, it was the same architecture. Linux
lost most the offical IrDA support after version 4.17, which means that last
major Ubuntu distribution to support it was 16.04 LTS. This version was not
available for AARCH64 machines, so you're going to need to emulate it. I'd
imagine that you can use Parallels or VMWare or something like that, but I've
found that UTM, a free tool that serves as a frontend for QEMU on macOS, works
quite well.

```
[   74.133664] usb 7-1: new low-speed USB device number 2 using uhci_hcd
[   74.717459] usb 7-1: New USB device found, idVendor=07d0, idProduct=4959
[   74.717487] usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[   74.717494] usb 7-1: Product: USB to IRDA
[   74.717500] usb 7-1: Manufacturer: Kingsun CO.
[   74.912650] NET: Registered protocol family 23
[   74.926339] KingSun KS-959 IRDA/USB found at address 2, Vendor: 7d0, Product: 4959
[   74.928090] net irda0: IrDA: Registered KingSun KS-959 device irda0
[   74.935388] usbcore: registered new interface driver ks959-sir
```

sudo apt install git cmake autotools-dev autoconf libtool pkg-config build-essential
git clone https://github.com/libdivecomputer/libdivecomputer.git
cd libdivecomputer
autoreconf --install
./configure
make
sudo make install
sudo irattach irda0 -s
dctool -vv -l scan.log scan -t irda
dctool -vv -l dump.log -f smart dump -o dump.bin -t irda



