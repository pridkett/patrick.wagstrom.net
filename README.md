patrick.wagstrom.net
====================

This is the source code for my web page. You probably want to visit the actual
web page at http://patrick.wagstrom.net/ rather than just browsing this source
code, but hey, whatever floats your boat.

Installation
============

Building and installation of the site is fairly straightforward. You'll need to install
[hugo](https://gohugo.io/), but that can be easily done on most platforms. On my Mac, you
can just run:

    brew install hugo
    make

And you should get all the pages generated in the `public` subdirectory.

If you want to run the web server to view the pages as you edit them, you can run:

    make serve

And it should fire up a web server on http://localhost:1313/ that you can use to look
at the pages as you edit them.
