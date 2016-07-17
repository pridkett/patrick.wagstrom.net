---
date: '2005-04-16T10:48:00-04:00'
old:
  layout: post
  oldcategories:
  - linux
  status: published
  timestamp: 10:48 AM Saturday, April 16, 2005 EDT
  wordpress_id: '218'
oldtags:
- finance
- java
- linux
- moneydance
- quicken
slug: goodbyequicken
tags:
- moneydance
- java
- finance
- linux
- quicken
title: Goodbye Quicken
url: /weblog/2005/04/16/goodbyequicken/
---

Three years ago I purchased a nice copy of Quicken Deluxe 2002 to help manage my finances.  By and large, I've been fairly happy with it.  There were a few features that I never could get running quite properly, namely [PNC Bank](http://www.pncbank.com/), [NetBank](http://www.netbank/), and allowing it to properly manage my savings bonds.  The PNC problem wasn't a big deal because that was our spending cash, so we didn't want to track it closely (we each get $100/month in our person accounts there). Savings Bonds I got around by using [Savings Bond Wizard](http://www.publicdebt.treas.gov/sav/savwizar.htm) from the Department of Treasury.  This left me with having to do all the NetBank stuff by hand. I could handle that, but it was less than ideal.

Come earlier this year I got a message in Quicken telling me about the [retirment of online services for Quicken 2002](http://web.intuit.com/support/quicken/sunset/).  After reading the message I realized what they were doing.  They were intentionally breaking software that was only three years old and trying to get me to shell out another $60 for a new version of Quicken.  That's dumb.  While I admire Intuit for being one company that has been able to stand up against Microsoft, they're not doing a very good job of pleasing their customers. Between this and the Turbo Tax boondagle a few years ago, I don't think I'm going to use them anymore.

This left me with a few alternatives.  I've got a copy of Quicken 2004 Basic that I could use.  I've never even installed it, it just sits on my shelf.  It was free when I bought Turbo Tax for my 2003 taxes.  My other options were to try a new program or do it by hand.  Actually, doing it by hand is not an option.  I could move to [Microsoft Money](http://www.microsoft.com/money/default.mspx), which I've heard good things about, but I don't really feel like supporting Microsoft.  That and it's a pain to start up [VMWare](http://www.vmware.com/) every time I want to enter a receipt into my software.

Although I like VMWare, it still sucks having to use it start up my finance software.  The led me to look at finance software that would run on Linux.  I used to use [GNUCash](http://www.gnucash.org/) once upon a time.  But my finances have become a bit more complicated since then, I've got a mutual fund that I need to track, mortgage payments, and car payments to deal with.  Not to mention that I don't believe that GNUCash can download statements from my banks or credit cards. Option number two was [jGnash](http://jgnash.sourceforge.net/), some personal finance software written in Java.  It looks pretty nice and the interface seems sane, but once again, I can't download my statements.  Suckage.  I'm not a huge fan of Java, but am willing to suck it up for something that runs well and does what I need.

The final option I looked at was [Moneydance](http://www.moneydance.com/).  I'm not sure why this popped back into my head, but I remembered seeing an old [slashdot article on Moneydance 2003](http://slashdot.org/articles/03/03/28/1811250.shtml?tid=185).  I went to the site, downloaded a trial copy and started playing around with it.  It definately takes some getting used to, but after a short time Moneydance could download most of my account statements. I still haven't quite figured out how to get it to download my Fidelity or PNC Bank accounts, but I don't track those as closely as I should.  I had no problems importing all of my data from Quicken either.  I just exported  verything as a QIF file and Moneydance imported it with no difficulty.

Another great thing about Moneydance is that it is [hackable](http://moneydance.com/developer.shtml).  There is a good extension kit available to write extensions in Java and a python shell is available.  Unfortunately, I haven't been able to find any real python scripts for it.  I wrote a short little test script that prints out the balance of each account in the shell window.  Having a hackable finance program is something I've been in search of for a long time.  I'd love to have a simple web page I can go to, enter some information about transactions and have my program automatically pull them up next time I open it up.  This seems like it might be doable under Moneydance.  It's strange that so many people talk highly of the ability to hack moneydance but never get around to it.  I'm pretty sure I'll hack it some.  It's in my nature.  Not to mention, hacking new UIs using [Jython](http://www.jython.org/) is actually quite nice (I've previously written some UI stuff in Jython for [GUESS](http://www.hpl.hp.com/research/idl/projects/graphs/guess.html)).

Unfortunately, Moneydance is still closed source, and this is the part that makes baby Richard Stallman cry.  I'm probably going to shell out the $30 for it regardless.  It's supported by basically a one man company, which makes me worry some, but it seems to have an active user community.  In the past Sean Reilly had to finagle with [AppGen](http://www.appgen.com/) to get the rights to the software, so I don't imagine he's going to give up on them that fast.  Anyway, I've finally got a piece of personal finance software that I don't feel filthy dirty for using and that runs on Linux.  I guess it's a step in the right direction.

As for my savings bonds issue, that's a completely moot point because of the most excellent [GBonds](http://gbonds.sf.net/) program.  I highly recommend it for folks using the [GNOME](http://www.gnome.org/) desktop.