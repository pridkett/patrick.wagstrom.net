---
date: '2009-09-08T20:55:00-04:00'
old:
  layout: post
  oldcategories:
  - computer
  status: published
  timestamp: 08:55 PM Tuesday, September 08, 2009 EDT
  wordpress_id: '741'
oldtags:
- bugs
- microsoft
- software
- word
slug: how-to-handle-a-bug
tags:
- computer
- microsoft
- word
- bugs
- software
title: How to Handle a Bug
url: /weblog/2009/09/08/how-to-handle-a-bug/
---

It’s no secret that almost all software has bugs. Even if you are lucky enough to understand how to formally verify a program, odds are that it won’t work for your program. It’s just far too difficult. Rather than eliminate all bugs, which is next to impossible to do, software engineers have sought ways to minimize the number of bugs present in a system and ensure timely responses when bugs are discovered in the field.

For a software engineer this typically means a suite of test cases. Each one is a carefully constructed situation that can be programatically reproduced. When a defect is found in the system, a test case is written that exercises the defect. Before future versions of the software are released the test cases must all pass. In rare cases you’ll find a team using full-on test-driven development where test cases are written before code is written for new functionality, but the basic process is the same.

From the end user perspective, this usually means patches for the software. In Windows these are often delivered via Windows Update or Office Update, although a myriad of programs have other more annoying ways to tell you that they need to be upgraded. In Mac OS X there is the software update feature that checks for major updates. Within Linux there is apt, or another equivalent tool that checks for updates on almost all software on the system. Why Mac OS X and Windows only check for updates on apps provided by the OS manufacturer and not for the whole system, as Linux does, could be the subject of another whole article.

What happens when a bug slips through the cracks? When happens when a bug is known, has been reported, is routinely experienced by hundreds or thousands of individuals, but doesn’t get patched through these methods? The result is an exercise in frustration that will leave many users searching for a new solution.

I’m going to illustrate this problem with a bug that I recently encountered. The time was around 1am on the Monday morning of Labor weekend. Papers were due at 6am for a major international conference, and I was wrapping up final revisions so I could go to bed. We were using Microsoft Word 2007 to create an academic paper that had many equations present. Submissions to the conference were required to be in PDF form, for which I typically use [PrimoPDF](http://www.primopdf.com/) in Windows, although I realize that Office 2007 has native PDF support. I clicked through to have PrimoPDF create a PDF and this is what I saw:

<div class="image caption center">
    <img src="/weblog/media/2009/09/missingequations.png" alt="Those white spaces are where my equations used to be.">
    <p>Those white spaces are where my equations used to be.</p>
</div>

That’s interesting, where did all of my equations go? I’m aware that word sometimes has strange settings that change the actual print output by removing things such as graphics, I looked at the print preview and double checked all my settings. Everything looked normal, the equations showed up in the print preview. I proceeded to try about two or three other PDF engines but had no luck in the process. It appeared that my document did not want to retain its equations.

I started to panic with thoughts of having to convert the paper to a different format at this late stage of the game. I googled around and found a variety of forum posts that provided suggestions. The first was simple enough, just use the native PDF support in MS Office 2007. I clicked through and I had a PDF of my document, but the quality was less than stellar, especially when on viewed on a Mac.

<div class="image caption center">
    <img src="/weblog/media/2009/09/badequations.png" alt="It seems like those curves are made up straight lines, almost as though a kindergarten student cut them out of construction paper">
    <p>It seems like those curves are made up straight lines, almost as though a kindergarten student cut them out of construction paper</p>
</div>

<div class="image caption center">
    <img src="/weblog/media/2009/09/fonts.png" alt="Windows is on the left, Mac is on the right. Here I though that PDF was supposed to look the same everywhere! Silly me">
    <p>Windows is on the left, Mac is on the right. Here I though that PDF was supposed to look the same everywhere! Silly me</p>
</div>

The problem results from the fact that Office 2007 won’t embed all of the fonts into the PDF document, rather it will try to provide alternative options or convert the fonts to a bitmap format if it can’t. Why won’t it embed all the fonts? Concerns about licensing — basically unless Windows can verify it has a license to redistribute the font in the PDF file, it won’t embed the font and you’ll be left with something less than awesome.

The next suggestion was to simply save the doc as an Office 2003 document. The solution said that the equations wouldn’t be editable anymore, but that they’d still show up. That was fine as I was done with paper and just needed a one-off version to submit to the conference. Unfortunately, rather than providing something like Wikipedia, which renders the equations to a high resolution PNG file and then embeds the image in a web page, MS Office converts the equations so they’re already pre-blurred from having drank too much. Once again, this was not going to work for academic work.

<div class="image caption center">
    <img src="/weblog/media/2009/09/word2003.png" alt="Can you spot the equations? They look like they were rendered on a Hercules graphics card">
    <p>Can you spot the equations? They look like they were rendered on a Hercules graphics card</p>
</div>

Although those two options “worked”, they were what are termed “workarounds”, and not even good workarounds, they were poor workarounds that provided decreased functionality. I work very hard to create high quality academic papers that look good, so I expect my tools to perform the tasks they advertised when I paid for them. I wasn’t going to submit something that looked amateurish.

Digging around some more and getting more creative with my Google query and finally stumped upon the [Microsoft Support Page for my bug](http://support.microsoft.com/kb/960985).  Apparently, this bug only affects systems that run the combination of Microsoft Office 2007 and Windows XP. If I were to use a system with Windows Vista, I should be fine.  Great, my wife has Vista Enterprise on her Tablet PC, so I copy the document over, and attempt to create a PDF of the document.  The equations look just fine, but wait, now it’s not printing half of my images.  Ughh.

<div class="image caption center">
    <img src="/weblog/media/2009/09/brokenfigure.png" alt="I swear I designed both the left and right sides of this figure">
    <p>I swear I designed both the left and right sides of this figure</p>
</div>

Finally, I attempt the actual fix for Windows XP.  Apparently the problem is somehow tied up between Windows XP, Office 2007, and right-to-left language support (for languages like Thai and Arabic). The knowledge base article provides helpful instructions on how to install support for those languages.  After following the instructions you’ll get the warning:

> You chose to install the Arabic, Armenian, Georgian, Hebrew, Indic, Thai and Vietnamese language files. This will require 10 MB or more of available disk space. The files will be installed after you click OK or Apply on the Regional and Language Options dialog box.

Oh no!  10 MB of disk space?  On my 7mbit DSL line that will take almost 20 seconds to download.  Not to mention it will take up such and small portion of my 500GB drive on my laptop I’m not even going to worry about it.  But then the dreaded message pops up:

<div class="image caption center">
    <img src="/weblog/media/2009/09/windowscd.png" alt="OMG! Are you serious‽‽">
    <p>OMG! Are you serious‽‽</p>
</div>

Seriously, WTF? There is no option to download the patch from the Internet.  I see no way that such a small component could be considered a marketable piece of IP, as both Mac OS X and Linux have far superior support for multiple languages and there are no other operating systems that would want to steal this feature.  This left me with the realization that to fix my problem I was going to need to run around my still largely packed apartment in Minneapolis to find a CD that I hadn’t used in years. A CD to fix a bug that has been known about for a long time and is the result of strange interaction between two components, both of which have automatic update features. Did I mention it was now 2:30am?  I shudder to think of my frustration if I had been either 1) at my place in New York, knowing that the CD was in Minneapolis or 2) working on a machine without an optical drive and not in possession of an optical drive around to install the upgrade.  Of course, at that point I probably wouldn’t have worried that much, instead I’d probably download a copy of the CD off the seedier side of the intarwebs.

I’m using this as an example of how not to handle a bug in multiple different ways.  Firstly, the bug seems common enough that MS should have had a test case for it.  It should have been caught in the development process and feature check for the equation editor.  Equations and graphics often go together on the same page, and it’s not just Ph.D. researchers who need them, I remember using equations and graphs on the same page when using Word 6.0 for Window 3.1 to type up lab reports for my high school biochemistry class.  It’s great that MS sells a version of Office for Students and Teachers which has this wonderful bug — at least it gets them to set their software expectations low from the beginning.  Now, a test case may not have caught it before it was released, but I know that the bug has been around long enough that a test case could have been created for the numerous service packs for Office and Windows that have been released since the bug was first found.  Most glaring is the fact that the bug wasn’t even fixed with Windows Vista, it just manifests itself in a new and creative way.  Test driven development may not have caught this, but I can’t help but wonder if it’s part of the build process at Microsoft.

Second, reading the support document on Microsoft’s site makes it sound a little like the Office and Windows teams were left pointing fingers at each other.  The end user doesn’t care what component is broken, they just want it fixed.  They don’t care if it requires an extra 10MB of disk space. They just want their program to function as advertised.  While I’m fine with working random command lines and installing random components, most end users don’t like this at all.  This is a process that should have been fixed by a service patch for either Office 2007 or Windows XP.  Unfortunately, neither team decided it was worth their time and the end user is left to pay the price.

Finally, the solution of requiring the CD reminds me a little too much of 2000 (yes, I’m aware that XP is from 2000, but it still is the best OS from MS until Windows 7 is officially released in a few weeks).  Most computers have gone mobile since 2000 and many have lost the CD drive in an effort to reduce size and power consumption.  Automatic update solutions have made users comfortable with pulling updates over the Internet, so why does this still require a CD?  This is a component that has no independent commercial value and an update to Windows XP could have just as easily forced support on everyone — it eliminates a lot of those boxes you see on web pages written in right-to-left languages too — or at the very least made it a download.

The biggest problem that I see here is that the bug was a complicated one.  I shudder to think of the tester who was responsible for finally figuring out that it was the third component, right-to-left language support, that caused the problems. However, the solution was needlessly complicated and filled with half-solutions that caused just as many problems as they fixed. As software engineers we can do better. Integrated update systems are a nice start — within APT it is possible to say that an update to an application requires an additional update to a different application.  For example, an update to Open Office could signify that it requires an updated version of iconv — a library for translating character sets.  When you update Open Office the new version of iconv would come along with it.  See, it’s not that hard, and it’s something that Linux has been doing right since 1995.