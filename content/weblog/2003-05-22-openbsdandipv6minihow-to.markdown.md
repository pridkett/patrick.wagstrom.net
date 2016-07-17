---
date: '2003-05-22T02:01:00-04:00'
old:
  layout: post
  oldcategories:
  - openbsd
  status: published
  timestamp: 02:01 AM Thursday, May 22, 2003 EDT
  wordpress_id: '99'
oldtags:
- ipv6
- howto
slug: openbsdandipv6minihow-to
tags:
- openbsd
- howto
- ipv6
title: OpenBSD and IPv6 Mini How-To
url: /weblog/2003/05/22/openbsdandipv6minihow-to/
---

After some mucking around, I've gotten IPv6 and OpenBSD to play nicely
together.  Furthermore, I've got my OpenBSD box acting as a router for my other
computers behind it, as such they all have globally addressable ipv6 addresses
now too.  I got a lot of help from Carl Brewer's page on [making a 6bone router
using OpenBSD](http://rollcage.bl.echidna.id.au/IPv6/openbsd.html), but needed
to do some small modifications to account for the changes between OpenBSD 2.8
and OpenBSD 3.3.

Here is the basic overview of what I needed to for this to happen.  Step 1 is
to set up an IPv6 tunnel.  There are a variety of services that can do this for
you, I'm using [TunnelBroker](http://www.tunnelbroker.net/) from [Hurricane
Electric](http://www.he.net/) (good people, they've been long time supporters
of [PHP](http://www.php.net/)).

When you register on TunnelBroker, they'll need information about your IPv4
endpoint.  Fortunately, I have a static IP address.  I'm not real sure how well
this would work if I didn't.  So let's just hope that you have a static IP
address (I may have to work around that when I move in a few months).  After
registering your endpoint, it will take up to 24 hours for the tunnel to be set
up (this is in contrast to places like [freenet6](http://www.freenet6.net/)
where you can get instant set ups, but my pings here seem to be lower, and you
get more options here).

After your tunnel is initialized, log back into TunnelBroker and look at the
example configuration.  Select OpenBSD from the list.  This should give a
configuration something like this:

    ifconfig gif0 giftunnel 66.1.1.250 64.71.128.82
    ifconfig gif0 inet6 alias 2001:470:1F00:FFFF::3B1 2001:470:1F00:FFFF::3B0 prefixlen 128
    route -n add -inet6 default 2001:470:1F00:FFFF::3B0

You can feel free to run those commands right away.  Also make sure you paste
those at the end of your **/etc/rc.local** configuration file.  You'll also
want to make sure that you've got a line to start rout6d in there too.  I have
this hunk of code in mine:

    # IPv6 Information
    echo -n ' setting up IPv6 to he.net'
    ifconfig gif0 giftunnel 66.1.1.250 64.71.128.82
    ifconfig gif0 inet6 alias 2001:470:1F00:FFFF::3B1 2001:470:1F00:FFFF::3B0 prefixlen 128
    route -n add -inet6 default 2001:470:1F00:FFFF::3B0
    route6d

At this point you can try a ping6 to the other endpoint, which is the second
set of numbers up there.

    ping6 2001:470:1F00:FFFF::3B0

If your ping6 went through, you're in really good shape to get your own /64
subnet.  This is a MAMMOTH amount of address space, but hey, it's IPv6.  Go to
the page on TunnelBroker and select /64 Allocation.  Then just click submit,
you can leave the fields blank for now until you set up ipv6 dns (which will be
covered in another writeup).

The page will reload and it will contain text similar to this:
`Assigned Prefix: 2001:470:1F00:572::/64`

This is your /64 address space allocation from Hurricane Electric.  Requests
for nodes on that subnet (which has a number of nodes equal to the square of
the TOTAL number of IPv4 nodes) will be routed to your OpenBSD box.  The next
step is to set up an ethernet interface to have an IPv6 address. In this case I
chose to give device ne1, which is my internal network interface, an IPv6
address.  This is what my **/etc/hostname.ne1** now looks like:

    inet 192.168.1.1 255.255.255.0 NONE
    inet6 alias 2001:470:1F00:572::1 64

The first line is the normal IPv4 address that I use for routing everything and
talking to all my nodes that are natted.  The second line sets up an alias for
IPv6.  While IPv6 does have this really cool concept of stateless
autoconfiguration, we're not going to use it here because this will be a
router.  So I've chosen to give this interface the first address in my IPv6
address space.  The 64 indicates how many bits in my subnet, in this case, 64.
A reboot or a quick running of **/etc/netstart ne1** will bring the device up.
If you run a **ifconfig ne1** you should see something like this:

    ne1: flags=8863<UP,BROADCAST,NOTRAILERS,RUNNING,SIMPLEX,MULTICAST> mtu 1500
            address: 00:80:ad:1b:cd:b7
            media: Ethernet manual
            inet 192.168.1.1 netmask 0xffffff00 broadcast 192.168.1.255
            inet6 fe80::280:adff:fe1b:cdb7%ne1 prefixlen 64 scopeid 0x1
            inet6 2001:470:1f00:572::1 prefixlen 64

If you see the last line with your address, you should be good to go.  The
second to the last line is the link identifier, but we're not going to worry
about that right now.  Unfortunately, we're not quite ready to test our
connection yet.  We need to set up the system so it does routing of IPv6
packets.  To do this you need to set the following lines in
**/etc/sysctl.conf**:

    net.inet6.ip6.forwarding=1      # 1=Permit forwarding (routing) of packets
    net.inet6.ip6.accept_rtadv=0    # 1=Permit IPv6 autoconf (forwarding must be 0)

These two options are mutually exclusive.  You can't do auto configuration and
also do routing, which makes sense, routers are supposed to have static
addresses.

Now we get to muck around in **/etc/rc.conf** and set some more options.  Here
are the ones that are important:

    rtadvd_flags=ne1        # for normal use: list of interfaces
                            # be sure to set net.inet6.ip6.forwarding=1
    route6d_flags=""        # for normal use: ""
                            # be sure to set net.inet6.ip6.forwarding=1
    rtsold_flags=NO         # for normal use: interface
                            # be sure to set net.inet6.ip6.forwarding=0
                            # be sure to set net.inet6.ip6.accept_rtadv=1

These options should make the route advertisement daemon start at boot time.
The last step you should have to do is to configure rtadvd.  You can do this by
editing **/etc/rtadvd.conf** and inserting text similar to this:

    ne1:\
            :addrs#1:addr="2001:470:1F00:572::":prefixlen#64:tc=ether:

Where you'll want to change ne1 to the proper device that you gave an ip to
earlier and add to whatever your /64 allocation from TunnelBroker is.

Now, all you need to do is reboot and you should be good to go (you could start
up everything manually, but rebooting is just as easy).  Now go back to
TunnelBroker and select connectivity and try to ping the IP address you just
created.  If all goes well, it should work.

If for some reason it doesn't work, you might have very tight rules for pf.
Placing these rules in should help out some (see [yesterday's article for more
on building a proper
firewall](http://patrick.wagstrom.net/weblog/archives/000124.html)):

    pass in quick proto 41 from any to any
    pass out quick proto 41 from any to any

Now comes the true test.  I've got a linux box (running a heavily modified
version of RedHat 7.3) behind my OpenBSD router.  If you have an IPv6 module
ready for your kernel you should be able to run **modprobe ipv6** and then your
devices connected to your OpenBSD router will immediately get IP addresses.
Here's what the output of **ifconfig eth0** looks like for me:

    eth0      Link encap:Ethernet  HWaddr 00:01:02:39:A5:67
              inet addr:192.168.1.2  Bcast:192.168.1.255  Mask:255.255.255.0
              inet6 addr: 2001:470:1f00:572:201:2ff:fe39:a567/64 Scope:Global
              inet6 addr: fe80::201:2ff:fe39:a567/10 Scope:Link
              UP BROADCAST NOTRAILERS RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:9259 errors:0 dropped:0 overruns:0 frame:0
              TX packets:14256 errors:0 dropped:0 overruns:0 carrier:0
              collisions:21 txqueuelen:100
              RX bytes:2440576 (2.3 Mb)  TX bytes:2228114 (2.1 Mb)
              Interrupt:10 Base address:0xe800

The second inet6 line should be an IPv6 address.  If everything went as planned
you should be able to go back to TunnelBroker and do a ping6 to that address
and it should work.  Furthermore, browsing the web will now use IPv6 if
possible.  This will get you the coveted [dancing kame](http://www.kame.net/).

Later on I'll post a more in depth article on getting applications running
under OpenBSD and Linux with IPv6.

**Update:** I've completed my [overview of IPv6 applications](/2003/05/22/ipv6applications/).