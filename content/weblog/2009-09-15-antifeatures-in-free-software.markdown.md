---
date: '2009-09-15T17:59:00-04:00'
old:
  layout: post
  oldcategories:
  - freedom
  status: published
  timestamp: 05:59 PM Tuesday, September 15, 2009 EDT
  wordpress_id: '746'
oldtags:
- features
- freedom
- fsf
- iceweasel
- nerds
slug: antifeatures-in-free-software
tags:
- features
- fsf
- freedom
- nerds
- iceweasel
title: Antifeatures in Free Software
url: /weblog/2009/09/15/antifeatures-in-free-software/
---

The [Free Software Foundation](http://www.fsf.org/) has, rightfully in most cases, alerted computer and technology users to the problem of “[antifeatures](http://www.fsf.org/bulletin/2007/fall/antifeatures/)“. Briefly, an antifeature is when a program does something to offer a lesser experience that took significant effort to accomplish. Often times antifeatures are used as differentiating elements between different versions of a product. When you buy the lesser version everything is still there, it’s just that there is a small amount of code that disables part of program. Code that had to be written by a software developer and cost money to implement.

Common examples of antifeatures are software packages that arbitrarily the number of remote connections (e.g. [Windows Server](http://www.microsoft.com/windowsserver2008/en/us/pricing.aspx) and [Apple Remote Desktop](http://www.apple.com/remotedesktop/)) and how inexpensive digital cameras automatically process [RAW](http://en.wikipedia.org/wiki/Raw_image_format) image data to JPEG — the latter is an example from the Free Software Foundation that may not hold up because of the cost in allowing a user to access the image processing pipeline in the middle, although the [CHDK](http://chdk.wikia.com/) hackers have made good headway.

With the Free Software Foundation so adamantly anti-antifeature, you can imagine my surprise when I discovered [GNU IceCat](http://www.gnu.org/software/gnuzilla/).  Not only is IceCat a duplication of effort of Debian’s [IceWeasel](http://wiki.debian.org/Iceweasel) software — both are versions of [Mozilla Firefox](http://www.getfirefox.com/) that lack the registered trademark of the Firefox branding, something that requires a usage agreement (note: IceCat originated before IceWeasel and originally was named IceWeasel, however the name was ceded to Debian when the latter became more dominant and higher profile). To be fair, Mozilla has little choice in this matter. You’re legally obligated to defend a registered trademark or you can lose it — a law that is fundamentally at odds with Free software. However, what is surprising about IceCat is that rather than providing the full access to the plugin ecosystem for Firefox, IceCat has chosen to provide access to only those plugins that are also Free software.

<div class="image caption center">
    [![Mozilla Firefox](/media/2009/09/firefox.png)](http://www.getfirefox.com/) vs. [![GNU IceCat](/media/2009/09/icecat.png)](http://www.gnu.org/software/gnuzilla/) vs. [![Debian IceWeasel](/media/2009/09/iceweasel.png)](http://wiki.debian.org/Iceweasel)

    <p>It's like there's a nerd fight and no one cares!</p>
</div>

This is clearly an antifeature. Somewhere out there in Internetland a programmer spent time to code a feature in IceCat that restricts the ability of a user to download all the plugins for Firefox. While this is very much in line with the Free Software Foundation’s stance on having all software be Free, it’s not good from a user choice standpoint, and is clearly an antifeature that is wholly different than the primary reason for the project — avoiding trademark issues with the Firefox branding.

I’m not attempting to say that IceCat is a bad project — I don’t use it, but I can understand why it is there — it serves as a bit of protection should something crazy go on with the trademark agreement for Firefox. Furthermore, the Free Software Foundation is perfectly free to create a parallel plugin ecosystem, but they should be entirely clear about it — in this case Free software isn’t about choice or freedom from licensing agreements, it’s about their ideology and how they can create a tool to enforce their worldview.