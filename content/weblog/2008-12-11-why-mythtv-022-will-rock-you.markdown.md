---
date: '2008-12-11T18:01:00-05:00'
old:
  layout: post
  oldcategories:
  - mythtv
  status: published
  timestamp: 06:01 PM Thursday, December 11, 2008 EST
  wordpress_id: '495'
oldtags:
- hdpvr
- hdtv
- mythtv
- qt
- vdpau
- xvmc
slug: why-mythtv-022-will-rock-you
tags:
- xvmc
- qt
- mythtv
- hdpvr
- hdtv
- vdpau
title: Why MythTV 0.22 Will Rock You
url: /weblog/2008/12/11/why-mythtv-022-will-rock-you/
---

Way back in May of 2003, when the internet was ugly and Web 2.0 didn't exist yet, CompUSA had an online deal that caught my eye - a [WinTV PVR-250 Hardware MPEG Encoder card](http://www.hauppauge.com/html/wintvpvr250_datasheet.htm) for $99 after rebate.  I had been debating the whole media center setup for a while and decided this was good time to make the leap.  The state of media center software at the time was pretty shoddy -- convergence was talked about, but rarely happened.  Windows Media Center wasn't generally available and [XBox Media Center ](http://www.xbmc.org/)was still in its infancy.  In either case, recording and playback of liveTV wasn't possible.  On the Linux front a war was being waged between [MythTV](http://www.mythtv.org/) and [Freevo](http://freevo.sourceforge.net/).  Freevo had a slick interface and supported almost any capture card, but because it shelled out to other programs for recording and viewing content, it just felt weird.  Furthermore, this lack of integration meant you couldn't use it like a TiVo to watch and record live TV because one program recorded TV while another played it back, and a notification was made only after it was done recording.  MythTV was still fairly new at the time, and sure enough, just before I got the card, support was added for hardware MPEG encoders that used the [IVTV driver](http://www.ivtvdriver.org/) -- such as the WinTV PVR 250.  I've been a reliable MythTV user and occasional hacker since then.

MythTV has developed very slowly since then.  Each new release brings support for a few more capture cards, and maybe some small new features, but it's slow development, especially in the user interface category leaves me feeling like I'm stuck in 2003 still.  With some luck, the upcoming release of MythTV 0.22 will change that.  In fact, MythTV 0.22 could really rock your world, and here is why:

### Hauppauge HD-PVR Support
MythTV remains one of the best choices if you want to capture high definition video.  The excellent support for pcHDTV cards, and the even better support for the incredible [HD HomeRun](http://www.silicondust.com/products/hdhomerun), make it trivial to capture over the air or unencrypted cable high definition signals.  However, once spot where MythTV cannot compete with Windows Media center is for premium cable channels.  MythTV will never be able to support cable card tuners  because of the closed environment that these external tuners live in and the current requirement that the tuners be locked to the PC they're purchased with.  So while it's perfectly easy to watch NBC and CBS in high definition, your hopes of being able to watch HBO or ESPN in high definition are slim at best.  Luckily, Hauppauge has developed an excellent solution that fits the needs of the MythTV user perfectly.

<div class="image caption center">
    <img src="/weblog/media/2008/12/hd_pvr_small.jpg" alt="The Hauppauge HD-PVR model 1212">
    <p>The Hauppauge HD-PVR model 1212</p>
</div>

The [Hauppauge HD-PVR](http://www.hauppauge.com/site/products/data_hdpvr.html) is a USB component video capture box that transcodes signals up to 1080i to H.264 video in real time.  On a technical level this means that you take the analog component (YPbPr) output of your cable TV box and it feed to the HD-PVR which will then re-digitize the video.  Quality snobs will note that this results in an extra stage of decompression and recompression which leads to artifacts, and they'd be right, but luckily the quality of the box is pretty good, so only the most discerning eye will notice a different in video quality.  HD-PVR support will be included in the next release of MythTV.

### QT4 and New Theming
MythTV is probably one of the last programs on the planet that still uses QT3 as it's widget set. It's a reliable widget set, with moderate theme capabilities, but it was clearly designed for desktop applications.  You can change the color and appearance of widgets, like scroll bars, buttons, and drop down menus, but it doesn't have the ability to provide nice transitions between screens or widgets.  Basically, you're working with a static widget set.  Sometime, probably a couple of years ago, MythTV introduced support for OpenGL screen transitions.  Now when I go from the main menu to my recordings screen, a nice transition happens, but on the screen I'm still using the same static screen with no transitions or interactivity.  Several times on the mailing list people have brought up how subtle transitions and audible feedback would really add to the experience -- after all, TiVo didn't succeed because it was the most feature filled, it succeeded because it had the best user interface.  Currently the closest thing that MythTV can do is run an external program that plays a sound when a key is received by the application.  I've tried it, and it's just not quite right.

QT4 should fix many of these issues.  Nokia didn't purchase QT to sell the widget toolkit as another system for creating desktop applications, they intended to use it in embedded applications where things don't always look the same.  The new features of QT4, which was released way back in 2005, really make it a top notch widget set.  In particular, the entire toolkit has been abstracted to work nicely with OpenGL, allowing for better transition effects, theming and mapping of graphics.

<div style="text-align: center"><iframe width="420" height="315" src="http://www.youtube.com/embed/MXS3xKV-UM0" frameborder="0" allowfullscreen></iframe></div>

Watch out for the [Trippy Pink Floyd Shit](http://www.boingboing.net/2008/05/27/mashed-frontier-airl.html) around 1:40

When combined with the [longstanding ticket to create and have all widgets use libmythui](http://svn.mythtv.org/trac/ticket/12), this means that effects will be getting a much needed overhaul.  Including smooth transitions on sliders and small amounts of sound effects.

### VDPAU Support
Although PCs have gotten much faster since MythTV first arrived on the scene, MythTV can still tax your computer, especially when watching HD content and doing other things in the background.  It's fairly normal for me to watch an HD program as it is recording, record another HD program, flag previous recordings for commercials, and transcode content all at the same time.  You can play with nice settings and realtime threads to ensure the playback never skips a beat, but that's difficult, also you're ignoring the fact that most modern video cards have video decoding acceleration built in -- effectively allowing you use your CPU only to push data across the bus, while the video card decodes and displays the video.

This support is nothing new, it's been around for a while in the form of XvMC.  Unfortunately, unless you're using a Via or Intel chipset, which are not common in standalone MythTV boxes, you're probably going to be out of luck here.  nVidia cards do have some support for XvMC, but you sacrifice color in your on screen display and it rarely works properly.  Furthermore, XvMC has some architectural issues that cause problems when decoding HD size content frames.  In November, however, nVidia announced the creation of [VDPAU](ftp://download.nvidia.com/XFree86/vdpau/doxygen/html/index.html) - the Video Decoding and Presentation API for Unix.  In a nutshell, VDPAU is a moderately generic API, like [Microsoft's DxVA](http://en.wikipedia.org/wiki/DirectX_Video_Acceleration), that utilizes nVidia's PureVideo technology to display video with less CPU.  Taking less CPU means that you can do more in the background and not worry about stuttering -- or, if you're concerned about power, heat, and noise, like most MythTV users, you can use a more efficient less power hungry processor.  Just how much better is it?  The guys at [Phoronix](http://www.phoronix.com/) did a series of [VDPAU benchmarks](http://www.phoronix.com/scan.php?page=article&item=nvidia_vdpau&num=1) that showed CPU usage with VDPAU go from around 40% with [X-Video](http://en.wikipedia.org/wiki/X_video_extension) to less than 5% with VDPAU.  More savings for you.

Even though VDPAU has been released for only a month, the MythTV guys are hard at work supporting it.  The first patches for VDPAU support were committed in late November and there has been heavy development ever since.  If you're thinking about getting a new video card an nVidia 9000 series looks like it would be a great choice.


### The Future
I'll be honest, there are times that I get really frustrated with the slow progress of MythTV and how the development seems to stall out frequently, despite its fairly large user base.  I don't consider myself  a developer of MythTV, but I have contributed patches to the project, such as [allowing the transcoder to crop letterboxes and pillarboxes from videos](http://svn.mythtv.org/trac/ticket/2581), and have worked as an advocate of MythTV locally.  Despite this, the poor usuability of the project continually has me evaluating other options, such as [Boxee](http://www.boxee.tv), which provides integration with Hulu and soon Netflix, but sadly lacks the ability to record and play back television.  I was really excited when Nero announced [LiquidTV](http://www.nero.com/enu/liquidtv-introduction.html), but the [poor review and complete inability to record QAM](http://www.engadgethd.com/2008/10/15/nero-liquidtv-tivo-pc-review/) make it useless in hilly Pittsburgh where cable is required if you want to receive more than one or two stations.  So, for the time being, I'm on MythTV -- it has a suitable wife acceptance factor and allows me to record most everything I want.  The changes coming down the pipe for 0.22 will only make that better.