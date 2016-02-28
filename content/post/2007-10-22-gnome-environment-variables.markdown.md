---
date: '2007-10-22T11:36:00-04:00'
old:
  layout: post
  oldcategories:
  - linux
  status: published
  timestamp: 11:36 AM Monday, October 22, 2007 EDT
  wordpress_id: '208'
oldtags:
- emacs
- environment variables
- gnome
- linux
- tips
- ubuntu
slug: gnome-environment-variables
tags:
- emacs
- gnome
- linux
- environment variables
- tips
- ubuntu
title: 'Things They Don''t Teach You In Tip-Of-The-Day: Environment Variables in GNOME'
url: /weblog/2007/10/22/gnome-environment-variables/
---

[Ubuntu](http://www.ubuntu.org/) has been incredibly successful in large part thanks to its ease of use and great packaging.  However, one thing they don't teach you is how to force your [GNOME](http://www.gnome.org/) session to export environment variables to processes.  When a process is launched from a terminal, you set these environment variables through `.bash_profile`, `.bashrc`, `.login` or other similar files.  You can't simply do this in GNOME.

The problem I'm facing is that I need a way to set a JAVA_HOME environment variable in emacs.  The naïve method is to create a launcher with the command `JAVA_HOME=/usr/local/java/jdk1.6.0 emacs`, after all, such syntax works from the shell and launches Emacs with the variable set.  However, the launcher mechanism in GNOME does not recognize this and will fail to launch.

The solution lies in a file that no one ever talks about, .gnomerc.  If you add the following lines to it, you should be able to export that variable to all applications launching in GNOME:
    :::bash
    JAVA_HOME=/usr/local/java/jdk1.6.0
    export JAVA_HOME

This is the same syntax you'll expect in bash, so if you use bash, you may be able to get away with symlinking `.gnomerc` from `.bashrc`.