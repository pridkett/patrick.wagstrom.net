patrick.wagstrom.net Generation Scripts
=======================================

Copyright (c) 2013 Patrick Wagstrom <patrick@wagstrom.net>

This project is licensed under the terms found in the `LICENSE` file (currently
MIT license).

A while back I got the great idea that it would be wonderful if I finally redid
my web page using something more interesting and more modern. The previous
version was written using XML and XSLT back in 2003, before it became
abundantly clear that XML is fit neither for human nor machine consumption.
This revelation came in part because a friend of mine was writing a new blog
software, [engineer][engineer], that created a static blog using
[markdown][markdown] source. Of course, I figured that I wanted to do something
similar for my whole web page, because wouldn't it be great to have a web page
written in Markdown that looked great? Yeah, that was six months ago.

Requirements
------------

* [middleman][middleman]: An all-purpose static website generator.
* [gpp][gpp]: The general purpose processor - a configurable macro language
  that works with just about everything. It's really helpful for C/LaTeX/HTML,
  and who knows what else. Plus, it's not nearly as arcane as [m4][m4].
* [pandoc][pandoc]: The swiss army knife of document conversion and probably
  the most famous program ever written in Haskell.
* [tidy-html5][tidyhtml]: An experimental fork of the [W3C][w3c]'s tidy tool
  for cleaning up HTML code. Strictly speaking this isn't necessary as pandoc
  produces valid HTML5 output, but I prefer to have my code neatly indented -
  which is what tidy-html5 excels at.

ToDo
----

* Make a command line option to use local or remote CDNs for thinks like Bootstrap, jQuery, and FontAwesome

[pandoc]: http://johnmacfarlane.net/pandoc/
[gpp]: http://en.nothingisreal.com/wiki/GPP
[tidyhtml5]: http://w3c.github.io/tidy-html5/
[m4]: http://www.gnu.org/software/m4/
[middleman]: http://middlemanapp.com/
