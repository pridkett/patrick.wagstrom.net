title: Steps to Free Wireless In Linux
timestamp: 09:40 PM Thursday, February 17, 2005 EST
status: published
slug: freewireless
tags:
- linux
url: /weblog/2005/02/17/freewireless/

layout: post
oldcategories:
- linux
wordpress_id: '205'

---

Here are the steps one can take to get free wireless in Linux.  As long as the
network isn't encrypted this should work.

1. Install and configure [Kismet](http://www.kismetwireless.net/).
2. Sniff traffic to find open access points.
3. If an open access point is not available, then sniff for MAC addresses.
    1. Modify your driver to force your MAC address to that of an existing client
    2. Make sure to write down your old address.
    3. Install the modified driver.
4. Enjoy your newfound wireless access.

Note, I'm doing the former, not the latter (i.e. I'm on an open access point).
If you get really ambitious, it might be possible to hack a WRT54G to do this
for you.  That would be fun.

**Update:** As a quick Googling found, there is no reason to recompile
your driver as long as it supports setting the hardware address.  To
do this, before you bring up the device run `ifconfig eth0 hw ether
01:02:03:04:05:06`.  More information is
[available here](http://www.talvi.net/notes/mac-spoofing.html).  I
have not tried this, nor do I advocate this, but it's just something
cool I think you can do.

