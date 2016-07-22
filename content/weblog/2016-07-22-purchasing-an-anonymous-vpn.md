---
comments: true
date: '2016-07-22T18:00:00-05:00'
slug: purchasing-an-anonymous-vpn
tags:
- bitcoin
- vpn
- experiment
title: How I Bought a (Nearly) Anonymous VPN
url: /weblog/2016/07/22/purchasing-an-anonymous-vpn
---

There's a ton of reasons why nearly everyone should consider using a VPN. They
allow to get around various region blocks, secure your traffic when on public
wifi networks, and generally can keep annoying prying eyes away from your
internet traffic. I'm not one of those people who thinks that you should always
use a VPN even when at home - I'm not that paranoid — but I recognize there are
reasons why you may want to. A few months ago I had a brief trip across country
with some down time and concluded this was a perfect chance to try and purchase
a 100% anonymous VPN.

## Step 1: Identify a VPN Host

I started out by looking at [That One Privacy Guy's VPN
Spreadsheet](https://thatoneprivacysite.net/vpn-comparison-chart/). This
recently moved to a dedicated site that isn't nearly as useful as the original
Google Spreadsheets version, but it still works. I had a couple of major
criteria that I was looking at in a VPN provider:

1. **Jurisdiction:** I'd rather have this not based in one of [the Fourteen
Eyes
countries](https://en.wikipedia.org/wiki/UKUSA_Agreement#9_Eyes.2C_14_Eyes.2C_and_other_.22third_parties.22).

2. **Anonymous Payment:** If this is going to be anonymous, I really should be
able to pay via Bitcoin. While technically Bitcoin isn't anonymous, it's
usually a lot better than handing over my credit card.

3. **No Restrictions:** I'm not buying this to do anything illegal. I'm buying
it to protect myself online. However, I don't want to ever run into the
situation where I can't use the VPN for something I'd like to do.

4. **No Logging:** Logging of anything kinda invalidates a lot of the purpose
of a VPN. The less logging the better.

5. **Multiple Hops:** Even with no logging, I want it so I can do multiple hops
and further obfuscate my traffic.

Looking through the list and browsing a couple of different sites, I decided to
use [IVPN](https://www.ivpn.net/) as my host. They're in [Gibraltar, which has
strange legal status as a self-governing overseas territory of the United
Kingdom](https://en.wikipedia.org/wiki/Gibraltar#Governance). This gives them
some protection from various British laws, while still providing a general rule
of law that some of the other VPN providers can't provide. I'm not going to do
anything illegal with this VPN, so maybe that would change if I were torrenting
or something else. IVPN also doesn't keep logs, allows bitcoin payment, and was
expensive enough that I don't think they're a fly-by-night operation. I could
see it reasonably costing $100/yr to provide a high quality VPN service, as
opposed to some fly-by-night operators that offer "lifetime" subscriptions for
$49.95.

**Privacy Steps:** I viewed this spreadsheet from an wifi access point in city
$X that is thousands of miles away from my home.

**Mistakes Made:** There were a few mistakes in this step. I opened up the
spreadsheet using my normal copy of Chrome on my MacBook Pro. I didn't even use
a private browsing session. The same browser was used for looking at multiple
VPN providers. I should have used [Tails](https://tails.boum.org/) to anonymous
my traffic and use a different session as I looked at each provider. I paid for
coffee at the coffee shop with my credit card and didn't scout out the location
for security cameras that might have captured me on video.

## Step 2: Acquire Payment

There are lots of different ways to get Bitcoin. I have no idea what the most
anonymous is, but I'd imagine that mining your own blocks is the way that would
be most anonymous as the blocks wouldn't have any history. Unfortunately,
mining Bitcoin now seems like a fools errand given the costs of power needed to
mine.

There are lots of places where you can easily purchase Bitcoin. I frequently
use [Coinbase](https://www.coinbase.com/) to buy and spend Bitcoin because it
makes it really easy. However, these aren't really anonymous. Luckily, going
way back in time from the time in which I used to mine Bitcoin I have a few
wallets on my local machine. However, none of these wallets have enough Bitcoin
in them to afford the $100/yr for IVPN. This means that I had to supplement my
Bitcoin with another source. Enter
[localbitcoins.com](https://localbitcoins.com/). I had learned a little bit
from my previous step of browsing, and by this point I was using Tails in a
virtual machine to browse [localbitcoins.com](https://localbitcoins.com/). I
also was smart and scouted out a seat in the coffee house that I'm pretty sure
was out of range of their CCTV. To be extra paranoid I also temporarily changed
the MAC address of my wifi card.

I was fortunate that I was in a bit of tech hub and was able to find someone
locally who could meet me in an hour. Unfortunately, I ended up paying a slight
premium - to be on the safe side I bought about $150 worth of Bitcoin and paid
about $155 for the Bitcoin. I had the coins transferred and verified they were
in my wallet within about five minutes.

Honestly, I expected this experience to be a lot more sketchy. For some reason
I thought that most of the people who used localbitcoin.com would look like
paranoid cyberpunks or drug addicts. I met the seller at a major mass transit
stop and the guy looked like your normal tech employee and was a pleasure to
chat with. I probably chatted a bit too long with him and eventually I blurted
out that this was part of an experiment in buying an anonymous VPN.

One major challenge with this step is that I didn't know where the Bitcoin came
from. I thought I remember seeing something that a very large volume of Bitcoin
were implicated in Silk Road, but [Lightspeed Venture Partners did the math and
found that it actually underperformed the global
average](http://lsvp.com/2013/08/15/about-half-a-percent-of-bitcoin-transactions-are-to-buy-drugs/).
I did briefly look at tumbling the Bitcoin through
[shapeshift.io](https://shapeshift.io/#/coins), but this was immediately after
[the period of one of their insider
sabotages](https://news.bitcoin.com/looting-fox-sabotage-shapeshift/). In
reality I shouldn't have said that last bit because it can help narrow down the
approximate date that I did all these actions.

**Privacy Steps:** Buying Bitcoin via localbitcoins ensured a minimal digital
trail. Connections to localbitcoins.com were made via a Tails throwaway VM from
a different anonymous wifi hotspot with a spoofed MAC address.

**Mistakes Made:** I communicated with the seller via text from my regular cell
phone number rather than a burner application such as
[Hushed](https://hushed.com/). I visited a local ATM to withdraw $200 in cash
to pay for the Bitcoin. I chatted far too long with the bitcoin seller in a
public location. I didn't tumble the Bitcoin to further anonymize them.

## Step 3: Get an Anonymous Email Address

One downside of IVPN is that it requires an email address. Getting an anonymous
email address isn't as easy as it once was. I had previously done some research
on this and decided that [ProtonMail](https://protonmail.com/) would be a good
choice. I went to a different coffee shop (I drink a lot of coffee when
travelling cross country alone) and booted up a copy of Tails inside of VM to
sign up. I made sure to generate a number of secure passwords with 1Password to
complete the signup process. This is a reasonably secure process, but I guess I
couldn've gone more secure and done something like a [diceware
password](http://world.std.com/~reinhold/diceware.html) that I couldn've
generated offline, but this worked well enough. Afterwards I saved the
credentials in my encrypted file which is synced to the cloud - that's probably
also problematic.

**Privacy Steps:** Unique email account in secure third country. High security
passwords. Used public wifi with spoofed MAC address to connect via Tails in a
VM.

**Mistakes Made:** Passwords saved in a password manager. Passwords generated
by a computer rather than doing it offline.

## Step 4: Sign Up

This was actually a very straight forward mechanism. I already had an anonymous
email address and a mechanism to make the payment to IVPN using Bitcoin. It was
just a matter of visiting the site to sign up. However, here's where I likely
made my biggest mistake. In the rush to get everything going I used the wifi at
the Airbnb where I was staying. I still used Tails in a VM, but supposing that
somehow that I could be traced back, this would dramatically reduce the number
of people that could be identified as using the connection. I also was lazy and
used the same Tails session for sending the Bitcoin, checking email, and
signing up with IVPN.

However, I was now complete. What would normally have been a five minute
process of signing up on a website and providing my credit card number and
email turned into a multi-day adventure in learning the ins-and-outs of
privacy.

**Privacy Steps:** Used Tails in a VM.

**Mistakes Made:** Reused same Tails session across multiple different
purposes. Connected to a wifi network that could easily identify me.

## What would I change in the future?

Thinking about this, I realized that a couple of my steps might have more
uniquely identified me. Certainly connecting to multiple different coffee shop
networks could make it easy to identify me through the use of closed circuit
footage. In the future it might be better to do all of this from a single
location. That location would have large scale public wifi and a location that
I could avoid security cameras. I would enter the location, linger for a while,
do the sign up process, linger for a bit more, then leave. This would at least
make it harder if someone was looking at the people who were coming and going.

Now that I have a VPN, I'd probably use that VPN in conjunction with Tails to
sign up for a new VPN. Basically my traffic would first be routed through two
different hope on the VPN and then sent out over Tor to anonymize my traffic.

Finally, if I wanted to be really secure, I'd probably have done all of this on
a burner laptop running a live image of Tails rather than running it inside of
a VM. While in general it's believed that you're well isolated running inside
of a VM and that you can't break out of a hypervisor, it's not beyond the realm
of possibility that a nation-state might have an attack that could work around
this. We know that the [FBI has previously cracked
Tor](http://www.theinquirer.net/inquirer/news/2458121/mozilla-wants-to-know-how-the-fbi-cracked-tor),
so it's probably prudent to assume that it only provides a minimal level of
security.

## Final Thoughts

I'm not one of those really security paranoid people. I have no intention to
use this VPN connection to do anything illegal. I'm sure that there were
mistakes made in this process, and I'd love to hear them in the comments below,
but for me this was a valuable learning experience.
