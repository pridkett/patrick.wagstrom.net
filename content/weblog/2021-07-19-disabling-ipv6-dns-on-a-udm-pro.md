---
title: "Disabling IPv6 DNS on Unifi Devices"
slug: disabling-ipv6-dns-on-unifi
date: 2021-07-19T21:03:22-04:00
tags:
- unifi
- unifios
- unifi-dream-machine
- ipv6
- dns
- unifi-dream-machine-pro
- udmpro
url: /weblog/2021/07/21/disabling-ipv6-dns-on-unifi
draft: true
---

Last year I finished the bulk of the upgrade to the network in my home. At the center of the network is a small rack of Unifi devices and some Unifi access points. It's been a terrific setup so far. My ISP, Spectrum, also provides a full /64 of IPv6 address space, which gives me lots of room to have fun.

I also run [Pi-Hole](https://pi-hole.net/) on my local network. While the bulk of the details of how I got it running in Docker with IPv6, NextDNS, and continually updated reverse DNS will be saved for a future post, this posed an intresting problem. I could configure my DNS on my Unifi Dream Machine to use the Pi-Hole as the DNS, but, because IPv6 machines will rotate through IP addresses, this resulted in sometimes hundreds of different hosts in my Pi-Hole logs. It became impossible to see what devices were querying remote hosts on my network.

<figure>
<a href="/weblog/media/2021/07/unifi-ipv6-dns-setting.png"><img src="/weblog/media/2021/07/unifi-ipv6-dns-setting.png" width="500" height="">
<figcaption>On the UDM Pro, you can set IPv6 DNS settings under Settings → Networks → Advanced</figcaption></a>
</figure>

When you have an IPv6 DNS set up, Apple devices (and probably others too), will default to using the IPv6 DNS servers first. This means that if you're unaware of this fact, you could be leaking your DNS entries to your ISP.

```
resolver #1
  search domain[0] : wagstrom.net
  nameserver[0] : 2600:6c65:767f:a25f:beef:beef:beef:beef
  nameserver[1] : 192.168.1.2
  nameserver[2] : 45.90.28.161
  nameserver[3] : 45.90.30.161
```

[INSERT PIHOLE SCREENSHOT WITH THOUSANDS OF HOSTS]

What I wanted to do was to find a way to disable IPv6 DNS on my local network. The simplest way was to insert some firewall rules on my Unifi Dream Machine. This collection of `ip6tables` commands effectively rejects all forwarding and outbound traffic to port 53.

```bash
ip6tables -A OUTPUT -p tcp --dport 53 -j REJECT
ip6tables -A OUTPUT -p udp --dport 53 -j REJECT
ip6tables -A FORWARD -p udp --dport 53 -j REJECT
ip6tables -A FORWARD -p tcp --dport 53 -j REJECT
```

But, I was still annoyed that the first query would take a long time. After that first failure, hosts on my network would realize the IPv6 DNS server provided didn't work and fall back to IPv4.

In a previous life, when I had a simple setup with a single OpenWRT router, I could set up my router so it broadcast a null value for DNS (DHCP option 6) on the DHCPv6 responses using this line in my configuration:

```
dhcp-option=option6:dns-server
```

Unfortunately, Unifi OS doesn't let you add custom values for DHCP option 6 directly, instead it parses out the values for your DNS servers. If those values are blank, it will just blindly pass through the values provided from your ISP. This means that if you've got IPv6 enabled and only set custom DNS for IPv4, then most of your DNS queries are still going to your ISP provided DNS - which in turns means they're still spying on you.



Today, I finally discovered a nice solution. There's a [special address space in IPv6 that maps to IPv4 addresses](https://en.wikipedia.org/wiki/IPv6#IPv4-mapped_IPv6_addresses): `::ffff:0000:0000` - `::ffff:ffff:ffff`. In this space you simply convert the last four octets from decimal to hex and drop them in. Or, if you're lucky, some applications like `dig` will simply let you append the IPv4 address in dotted quad notation like this: `::ffff:192.168.0.1`.

In my case, because my Pi-Hole installation is at 192.168.1.2, I can covert that to `::ffff:c0a8:102` and this will force all DNS requests to my local Pi-Hole over IPv4 and make it super easy to track everything across hosts on my network.

<figure>
<a href="/weblog/media/2021/07/unifi-ipv6-to-ipv4-dns-setting.png"><img src="/weblog/media/2021/07/unifi-ipv6-to-ipv4-dns-setting.png" width="500" height="235">
<figcaption>Setting your IPv6 DNS to the IPv4 in IPv6 range forces all DNS to IPv4</figcaption></a>
</figure>

What's even more interesting about this is as opposed to setting a full IPv6 DNS entry as the first resolver, MacOS sets it as the last entry and helpfully decodes the address. You can see this by running `scutil --dns`

```
resolver #1
  search domain[0] : wagstrom.net
  nameserver[0] : 192.168.1.2
  nameserver[1] : 45.90.28.161
  nameserver[2] : 45.90.30.161
  nameserver[3] : ::ffff:192.168.1.2
```

Going back and checking your Pi-Hole after a day or so (you need to wait for your DHCPv6 leases to expire), will reveal that all of the queries to your Pi-Hole will now be over IPv4. You once again have transparency into your network.
