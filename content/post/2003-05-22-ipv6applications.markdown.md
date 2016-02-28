---
date: '2003-05-23T00:04:00-04:00'
old:
  layout: post
  oldcategories:
  - openbsd
  status: published
  timestamp: 12:04 AM Friday, May 23, 2003 EDT
  wordpress_id: '66'
oldtags:
- ipv6
- howto
slug: ipv6applications
tags:
- openbsd
- howto
- ipv6
title: IPv6 Applications
url: /weblog/2003/05/23/ipv6applications/
---

In [yesterday's article](/2003/05/22/openbsdandipv6minihow-to/) I wrote about
how to get [OpenBSD](http://www.openbsd.org/) and IPv6 to play nicely together,
so you could get some basic applications running.  Today, I'm going to go into
some more depth and tell about how to get some applications going.

#### Finding Hostnames

One of the most basic things that you'll want to do is look up hostnames on the
Internet.  For IPv4 an address record is an A record, for IPv6 it is an AAAA
record. Thus, to get the IPv6 address for a host run the command **dig
[hostname] AAAA** to get the record.

#### Web Browsing

The first that you'll probably want to get going is web browsing.  If for
nothing else than allowing you see the wonderful [dancing
kame](http://www.kame.net/).  The great thing is that for newer versions of
[Mozilla](http://www.mozilla.org/), [Konqueror](http://www.konqueror.org/), and
[Galeon](http://galeon.sf.net/) you don't need to do anything.  By default if a
host also has an IPv6 address, it will try to access it over IPv6.  The problem
comes when you try to enter IPv6 addresses into your address bar, usually
they'll get mangled.  To fix this, for an address you can put the address in
brackets.  Thus, you should see that
[http://www.wagstrom.org/](http://www.wagstrom.org/) and
[http://[2001:470:1f00:572::1]/](http://%5B2001:470:1f00:572::1%5D/) will take
you to the same location, which is my little IPv6 test web server.

#### Web Servers

I've read some stuff that [Apache](http://httpd.apache.org/) apparently has
IPv6 support built in natively as of version 2.  Unfortunately, the chroot
version of it in OpenBSD is still based on version 1.3, so there is no IPv6
support, at least not that I could tell.  Because I'm lazy, I didn't want to go
and install a whole new version of Apache, after all, my current setup works
fine and there is no reason to think people will currently get added benefit
from accessing it under IPv6.

Looking for a simple solution I settled on [thttpd
2.23](http://www.acme.com/software/thttpd/).  This was pretty straight forward
to compile, in fact no additional options were needed to get IPv6 support.
Then I wanted to start serving web pages from a special IPv6 directory under my
normal html directory.  To do this, I added the following commands to
**/etc/rc.local** to start up thttpd:

    # thttpd startup
    echo -n ' thttpd ipv6 webserver startup'
    y=`pwd`
    cd /home/patrick/public_html/ipv6
    thttpd -p 80 -h 2001:470:1f00:572::1 -r
    cd $y

This very simply echoes that it is starting up the web service.  Stores the
current directory in a variable.  Changes into the director where the web pages
are being served from, and then starts up an instance of thttpd.  The **-p 80**
tells it to listen on port 80, while the **-h 2001:470:1f00:572::1** gives the
IP address that the daemon should bind to.  A quick restart later (or just
running the commands as root) and you should be able to access you brand
spanking new IPv6 web server.

#### SSH

Probably one of the best reasons to use IPv6 is to avoid manual tunneling to get to a machine that resides behind a NAT device.  [OpenSSH](http://www.openssh.com/) supports IPv6 natively.  Once you have IPv6 running, you'll need to give the server a restart (so it will know to start listening on the IPv6) interfaces.  Then you can connect to it by referencing an IPv6 only hostname or IP address.  If the machine has entries for both IPv4 and IPv6 you can specify the -6 flag to force IPv6.  For instance:

    $ ssh -6 yourhost.ipv6.yourdomain.com

should connect to your designated host via IPv6.  You'll get a good idea based on where the system says you're coming from when you first log in.

#### IRC

Although most of the unix IRC clients claim to have support for IPv6, the only
one I've been able to get to work successfully is
[BitchX](http://www.bitchx.com/).  You'll probably need to recompile it to
enable IPv6 as the default compiled package for OpenBSD does not support IPv6.
You can do this by setting **WITH_IPV6=yes** if compiling from ports, or doing
**./configure --enable-ipv6** if compiling from source.

After this point you'll probably want to connect to an IPv6 irc server.  Two
that I've had good luck with are irc.ipv6.homelien.no and irc.efnet.nl.  The
problem, is that because both of these have IPv4 addresses you'll need to
manually give it the IP address of the server to connect to.  You then connect
by doing the usual server command, but appending a comma to the hostname.  Thus
**/server 2001:840::1000,** and **/server 2001:7b8:3:3f:201:2ff:fef6:574e,**
will connect you to irc.ipv6.homelien.no and irc.efnet.nl respectively.  Once
you have everything set up, you should see something like this when you do a
whois:

    +----------------------------------------- --  -
    | pridkett (patrick@dreams.ipv6.wagstrom.org) (Internic Non-Profit Organization)
    | ircname  : patrick wagstrom
    | channels : #openbsd
    | server   : irc.ipv6.homelien.no (Who Cares -- IPv6!)
    | away     : pridkett - is away: (Auto-Away after 10 mins) [BX-MsgLog On]
    : idle     : 0 hours 22 mins 5 secs (signon: Thu May 22 16:25:40 2003)

However, you should be prepared to know that DCC will stop working unless that
other person is using an IPv6 host.  So if you use IRC to talk, this is fine.
If you use IRC to download MP3s or warez, continue using IPv4.

#### DNS

Unfortunately, most DNS service providers do not support the AAAA record type,
this includes [dyndns.org](http://www.dyndns.org/) whom I use to administer
wagstrom.net.  However, as I had wagstrom.org sitting around and not being
used, I figured that I would get that set up.  The first thing that you need is
a host with a static IPv4 address because nameservers still require IPv4 to
work.  Then go and update your records to point your domain at your DNS, in my
case this is at 66.1.1.250.

The version of BIND that ships with OpenBSD is IPv6 enabled, so once you get it
going, you shouldn't have any problems.  The first thing you need to do is edit
**/etc/rc.conf** and change this line:

    named_flags=""          # for normal use: ""

This tells OpenBSD to start up the name server on the next boot.  Now you need
to go to **/var/named/etc** and add your domain to your named.conf as you would
an IPv4 domain.  In my case I did the following:

    zone "wagstrom.org" {
            type master;
            file "master/wagstrom.org";
            allow-transfer {
            };
    };

You'll want to change it for whatever your domain is.  The next step is to
create the domain file.  This should reside in
**/var/named/master/wagstrom.org**.  Here is what mine looks like:

    ; File: wagstrom.org
    ; wagstrom.org network file
    ; support of IPv6 hostnames
    ;
    @       IN      SOA     ns.wagstrom.org.        root.wagstrom.org.      (
            2003052101      ; serial number YYYYMMDDrr
            3H              ; refresh
            15M             ; retry
            1W              ; expiry
            1D )            ; minimum

            IN      NS      ns.wagstrom.org.
            IN      MX      10 scissors.wagstrom.net.
    ;
    ; Local Hosts
    ;
    ns                      IN      AAAA    2001:470:1f00:572::1
                            IN      A       66.1.1.250
    scissors.ipv6           IN      AAAA    2001:470:1f00:572::1
    scissors.ipv4           IN      A       66.1.1.250
    scissors                IN      CNAME   scissors.ipv4
    www.ipv6                IN      CNAME   scissors.ipv6

Most of that  should be pretty straight forward.  I have different host names
for my host for IPv4 (scissors.ipv4.wagstrom.org -> 66.1.1.250) and IPv6
(scissors.ipv6.wagstrom.org -> 2001:470:1f00:572::1).  In addition, I have
ns.wagstrom.org mapping to both an IPv4 and an IPv6 address.  It's important
that this be in place and running for a while before trying to get reverse DNS
to work.

#### Reverse DNS

One of the really nice features of [Tunnelbroker](http://tunnelbroker.net/) is
that it also allows you do your own reverse DNS.  Combined with the massive
amounts of address space that IPv6 provides, this means a limitless number of
virtual hosts with cool names like i.am.a.37337.hax0r.from.wagstrom.org for
your use on IRC.  Or, more realistically, it makes it nicer for when you SSH to
your other IPv6 boxes so you don't have to guess what host it was from by the
really long IP address.

To get all of this going you'll want to log in to Tunnelbroker.  Then select
your /64 allocation.  From your /64 allocation there is a spot to put the
hostname of your name server.  I'm not sure, but I think it needs to resolve in
both IPv4 and IPv6 address space.  If it doesn't odds are that Tunnelbroker
will come back and yell at you.  I can't be sure because the docs are pretty
sparse for it.

Anyway, so this assumes that Tunnelbroker has accepted your DNS.  Now comes the
fun part, reverse DNS names for ipv6 are in the ipv6.arpa domain (older
versions had them in the ipv6.int domain, you'll probably want to use both for
now as ipv6.arpa doesn't work on [freenet6](http://www.freenet6.net/)
allocations).  The easiest way to do this is to use [the IPv6 reverse DNS zone
builder](http://tools.fpsn.net/ipv6-inaddr/).  This handles the headache of
converting your domain.  Follow their instructions and you should be good.

Otherwise, you can be a masochist and it by hand.  The first thing is to figure
out what domains you're going to be doing revese DNS for.  You do this by
reversing the subnet (don't forget to add your zeroes back in) and putting
periods between them and finally smacking on a ip6.arpa at the end.  This
2001:470:1f00:572::/64 becomes 2.7.5.0.0.0.f.1.0.7.4.0.1.0.0.2.ip6.arpa.
That's a mouthful.  Here's the code that I put in my
**/var/named/etc/named.conf** file:

    /* 2001:470:1f00:572::/64
     */
    zone "2.7.5.0.0.0.f.1.0.7.4.0.1.0.0.2.ip6.arpa" {
            type master;
            file "master/ipv6.arpa";
            allow-transfer {
            };
    };

That was fun. Now you get to do it for each of your hosts! Remember, those
zeroes that disapper with the :: in the address, well ,they're back.  So this
is the contents of my **/var/named/master/ipv6.arpa** file:

    $TTL 3d ; Default TTL (bind 8 needs this, bind 9 ignores it)
    @       IN SOA 2.7.5.0.0.0.f.1.0.7.4.0.1.0.0.2.ip6.arpa. wagspat.iit.edu. (
                    2003052100        ; Serial number YYYYMMDDrr
                    24h             ; Refresh time
                    30m             ; Retry time
                    2d              ; Expire time
                    3d              ; Default TTL (bind 8 ignores this, bind 9 needs it)
    )

    ; Name server entries
                                            IN     NS     scissors.wagstrom.org
    ; IPv6 PTR entries

    ; Subnet #1
    $ORIGIN 2.7.5.0.0.0.f.1.0.7.4.0.1.0.0.2.ip6.arpa.

    1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0         IN      PTR     scissors.ipv6.wagstrom.org.

If all goes well, in another few hours you should be able to log into IRC over
IPv6 from your host and you'll see your brand new IPv6 domain name coming up as
the reverse DNS.