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

### Mac OS X Installation

### Linux Installation

My Linux netbook runs Fedora, so these instructions cover only Fedora. If
you're running Ubuntu or other version of linux, they should be pretty easy to
translate.

First, only `pandoc` is in the standard Fedora Core repositories.

    yum install pandoc

Now, install `tidy-html5` from source with the following commands:

    git clone https://github.com/w3c/tidy-html5
    cd tidy-html5
    make -C build/gmake
    sudo make install -C build/gmake

Finally install `gpp` from source with the following commands:

    wget http://files.nothingisreal.com/software/gpp/gpp.tar.bz2
    tar -jxvf gpp.tar.bz2
    cd gpp-2.24
    ./configure
    make
    sudo make install

Compiling the Pages
-------------------

The site is constructed in markdown in the `site` directory. Any file that ends
in `.md` is automatically run through the compilation chain to create an HTML
file. All other files are copied over with any change. This means that if you'd
like to mix HTML and markdown you can, but it's probably a waste of time.

Once you've created your files just run `make` and the `.md` files should be
compiled into HTML files and placed into the `publish` directory.

Specialty Macros
----------------

There are a variety of custom macros that are used to extend markdown and make
it easier to write beautiful documents without having to replicate my code
everywhere.

* ***`<#RELBASE>`***: defines the relative path to the base of the document.
  This is used primarily in common headers and footers that need to link to
  other documents in the site. While it would be possible to just change all of
  these to absolute paths, this allows you to browse the site through a browser
  without the need to fire up a local webserver.
* ***`<#header PAGE TITLE>`***: used at the top of every page to automatically
  include the common header material.
* ***`<#footer>`***: used at the bottom of the page to close off the HTML for
  the page. This should generally be done before the set of markdown links. For
  example

    <#footer>
    
    [nytimes]: http://www.nytimes.com/
    [github]: http://www.github.com/

ToDo
----

* Make a command line option to use local or remote CDNs for thinks like Bootstrap, jQuery, and FontAwesome

[pandoc]: http://johnmacfarlane.net/pandoc/
[gpp]: http://en.nothingisreal.com/wiki/GPP
[tidyhtml5]: http://w3c.github.io/tidy-html5/
[m4]: http://www.gnu.org/software/m4/
[middleman]: http://middlemanapp.com/
