title: What you should love about Ubuntu Gutsy
timestamp: 05:28 PM Tuesday, September 25, 2007 EDT
status: published
slug: what-you-should-love-about-gutsy
tags:
- gutsy
- linux
- gnome
- ubuntu
url: /weblog/2007/09/25/what-you-should-love-about-gutsy/

layout: post
oldcategories:
- linux
oldtags:
- gnome
- gutsy
- linux
- ubuntu
wordpress_id: '190'

---

The newest releast of [Ubuntu](http://www.ubuntu.com/), codenamed Gutsy Gibbon, is less than a month away.  In preparation for manning the [GNOME](http://www.gnome.org/) booth at [Ohio LinuxFest](http://www.ohiolinux.org/), I recently upgraded my laptop to the latest development release of Ubuntu Gutsy.  This newest release features GNOME 2.20, kernel 2.6.22, and OpenOffice.org 2.3, amongst other things. This isn't meant to be a complete review of Gutsy, rather, its what you should like about it -- mainly because it's what I like about Gutsy.

One of the more controversial moves in Gutsy was enabling desktop effects by default.  No longer is XGL-based-composited-desktop-bling limited to people with too much time on their hands and access to apt repositories. If you want to disable the effects, go to System->Preferences->Appearance, and select the Desktop Effects tab.  Uncheck it to make the effects go away and return to your plain, boring, desktop experience. It's also nice to see that Compiz has gotten smart enough to realize that it can't run on desktops where the maximum texture size is less than the desktop resolution.  This means that on my T43p, which has an ATI card with a 2048x2048 maximum texture size, Compiz will safely back to metacity if I'm running multiple monitors.

Along with compositing, Gutsy supports the new xrandr 1.2 protocol.  While xrandr 1.2 breaks some older xorg.conf files, the improvement is well worth it.  In my old setup, I had a customized xorg.conf that took advantage of a few ATI settings to automatically detect the monitors connected and size the output accordingly.  Unfortunately, if I wanted the external display to be active, it needed to be connected when X started.  This caused many unnecessary restarts of X and loss of session information.  Xrandr 1.2 fixes a lot of these problems by allowing for dynamic addition of monitors and reconfiguration of those monitors.  This means that while running I can plug in a new monitor, have xrandr read the EDID information for the capabilities and configure the new display without having to restart X.  As someone who gives lots of presentations, this is a life saver.  There's even a graphical tool, grandr, that allows you to drag and drop your monitor configuration. Grandr isn't feature complete -- I've found some bugs in grandr that cause it to crash and die. Look for me to post my git repository with fixes soon.

Another great feature for laptop users is the improved power management.  Putting my laptop to sleep and then waking it up again is much faster and more reliable. Before I was never certain what key I needed to press to get the laptop to come back to life, and even then it was unreliable.  Now I just tap the "Fn" key and the laptop comes right back to life.  Great support that just works.

There's also the usual batch of incremental changes to the system, such as tweaked graphics, new versions of minor programs, and additional utilities to keep you happy about your shiny new Linux desktop.  GNOME 2.20 has come together as one of the most solid releases yet.  Add in a few companion programs like F-Spot and Banshee for Media and Conduit for synching your data and you'll have a great and open desktop experience for far less than what the other guys want.
