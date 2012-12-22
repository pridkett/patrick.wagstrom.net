title: Mono.Readline
timestamp: 11:28 PM Wednesday, September 29, 2004 EDT
status: published
slug: monoreadline
tags:
- mono
url: /weblog/2004/09/29/monoreadline/

layout: post
oldcategories:
- mono
wordpress_id: '314'

---

So I've got plans for a larger scale social network analysis tool in my future, however
for right now, I need to get some of the groundwork laid.  I realize that some of the key
components of such a tool are going to be [IronPython](http://www.ironpython.com/),
for handling of scripting various modules, and a good command line interface.  The major
problem that I see with most tools right now is that either they run exclusively in batch
mode or require a GUI.  What I want is a prompt where I can run my analysis as though
I'm programming.






Anyone who has taken the time to use command prompt programs and programming languages knows
what a great blessing a good input system can be.  As far as I'm concerned,
[GNU Readline](http://cnswww.cns.cwru.edu/php/chet/readline/rltop.html) is the tops
when it comes to this.  However, I was dismayed because there was no obvious binding to provide
support for [Mono](http://www.mono-project.com/).  That is, until now.






Today I announce the first release of Mono.Readline.  Basically it's a little binding that creates
a stub library to allow Mono to access the GNU Readline library.  It's hella cool.  And best of
all, I didn't really write it.  It's mainly ripped out of [Martin
Baulig](http://primates.ximian.com/~martin/blog/)'s code in the mono debugger, but this way it's easier to use and get access to.  All
in a nice autoconf'ed package for you.  So go ahead, download [mono-readline 0.0.1](http://patrick.wagstrom.net/projects/personal/mono-readline-0.0.1.tar.gz) today!  Please, also let me know what you think about it
as this is the first real package I've put out using the autotools.

