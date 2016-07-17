---
date: '2006-03-15T10:28:00-05:00'
old:
  layout: post
  oldcategories:
  - linux
  status: published
  timestamp: 10:28 AM Wednesday, March 15, 2006 EST
  wordpress_id: '203'
oldtags:
- devil\'s pie
- emacs
- full screen mode
- gnome
- gtd
- hacks
slug: full-screen-emacs
tags:
- full screen mode
- gtd
- gnome
- devil\'s pie
- linux
- emacs
- hacks
title: Emacs in Full-Screen Mode
url: /weblog/2006/03/15/full-screen-emacs/
---

Last most graduate students I'm enjoying my spring break doing work.  But hey, at least I don't have many meetings this week.  Most of my work has been on trying to get a paper out the door and finished up for a [CSCW 2006](http://www.cscw2006.org/) this fall. It's a little weird trying to explain to my non-CS type friends that most CS conferences you submit a full paper, and it's a lot like a journal publication process.

However, it's not always easy, I find that I'm pretty easily distracted, especially now that I just got this shiny new [T43p laptop](http://www.thinkwiki.org/wiki/Category:T43p) from [my advisor](http://www.casos.cs.cmu.edu/bios/carley/carley.html).  Desperately seeking a way to make myself a little more productive, or maybe just kill a bit of time, I swung over to everyone's favorite productivity/[GTD](http://del.icio.us/tag/gtd) site, [43folders](http://www.43folders.com/).   It was there that I read about [full screen mode](http://www.43folders.com/2005/11/15/fake-fullscreen/), and how it might be able to help me out.  On linux, you've got a couple of choices for that, you can run in console mode, which is really fast, but greatly restricts the amount of information you can have on the screen.  You can run with a lightweight window manager that puts no borders on the windows, such as [ratpoison](http://www.nongnu.org/ratpoison/) -- but this would require me to restart my X-session, which while probably good, is not what I was looking for.

Then I remembered something from [Ross Burton](http://www.burtonini.com/), [GNOME](http://www.gnome.org/) hacker extraordinairre, [Devil's Pie](http://www.burtonini.com/blog/computers/devilspie). This little tool lets you write a bunch of s-expressions to match windows and do funky things with them, like minimize them, move them a particular desktop, remove them from the task list, etc.  It was originally intended to be a replacement for the fact that Metacity doesn't support matched windows like [Sawfish](http://sawmill.sourceforge.net/) used to.  Normally you start up Devil's Pie in the background of your session and it watches for windows that match a set of scripts you feed it.  This little Devil's Pie script should take care of that:

    :::cl
    ;;
    ;; simple devils pie to cause emacs windows to go all full screen
    ;; no distractions is good!
    ;;
    (if (or (contains (window_class) "emacs") (contains (window_class) "Emacs"))
      	(undecorate fullscreen))


However, this is not exactly what I wanted to do, I wanted to make Emacs full screen only when I told it to be full screen, not all the time.  This required some selective bash hackery to start up Devil's Pie with an icon click and then kill it when it had finished it's work.  This little script does that:

    :::bash
    #!/bin/sh
    # simple script that will full-screen mode your emacs session
    # see http://www.43folders.com/2005/11/15/fake-fullscreen/
    devilspie -a $HOME/emacs/emacs-maximize.ds &
    sleep 2
    kill %1 2>/dev/null >/dev/null


Saving these scripts as `emacs/emacs-maximize.ds` and `emacs/emacs-maximize.sh` should do the trick for you.  Then create an icon on your panel that launches the second script, and voila.  Click and full screen for your emacs session.

I had given some thought to making an unmaximize icon, however I decided that if I maximized the window full screen it was probably for a very good reason, and I shouldn't make it that easy to unmaximize it.