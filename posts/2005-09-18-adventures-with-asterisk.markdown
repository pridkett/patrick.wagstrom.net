title: Adventures with Asterisk
timestamp: 08:56 PM Sunday, September 18, 2005 EDT
status: published
slug: adventures-with-asterisk
tags:
- fwd
- asterisk
- VOIP
- gizmo
url: /weblog/2005/09/18/adventures-with-asterisk/

layout: post
oldcategories:
- asterisk
oldtags:
- asterisk
- fwd
- gizmo
- VOIP
wordpress_id: '194'

---

Last week [discovered Gizmo](/weblog/computer/gizmo.xml), the neato VOIP
service from [SIPPhone.com](http://www.sipphone.com/).  After talking to
some [WPLUGgers](http://www.wplug.org/), I was inspired to install
[Asterisk](http://www.asterisk.org/), the open source PBX software.
If I actually had a land line, this might be more useful, but without one, I was
determined to make use of it.  As I found out, it's pretty simple to do a gateway both
to and from the PSTN.

The first thing that I discovered is that it is possible to have Asterisk behave
as your Gizmo client.  Using [these instructions](http://www.voip-info.org/tiki-index.php?page=Asterisk%20settings%20Gizmo), you'll quickly get it so folks dialing your Gizmo number will
reach your Asterisk PBX.  Supposedly, those instructions will also let you use
another client to make calls out to the GIZMO network, but I've been unable to
get that to work yet.

The next cool thing was getting a free Washington state phone number from [IPKall](http://www.ipkall.com/).
It was terribly simple to set up, just fill out the form, and for the SIP proxy give it proxy01.sipphone.com,
and my Gizmo phone number as the user, and within an hour I had a dial in number to my computer.
So now I can go and dial 360-469-0573 and I'll reach my computer.  Right now it's just an echo
test, but I'd eventually like to be able to dial into my MythTV box.

Anyway, as I do more fun stuff, I'll post it here.  Next up is fun
with [Free World Dialup](http://www.fwd.pulver.com/).  That will provide 1-800 number access direct from my box.  I was hoping
that I could already have it working, but it's having problems with IAX (that's the Inter-Asterisk
protocol) at the moment.  Also, it looks like [IAX Tel](http://www.iaxtel.com/) is
also not behaving well right now.
