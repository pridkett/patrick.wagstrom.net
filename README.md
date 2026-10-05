patrick.wagstrom.net
====================

This is the source code for my web page. You probably want to visit the actual
web page at http://patrick.wagstrom.net/ rather than just browsing this source
code, but hey, whatever floats your boat.

Installation
============

Building and installation of the site is fairly straightforward. You'll need to install
[Hugo extended](https://gohugo.io/installation/). The publishing workflow pins
Hugo **0.167.0**; the site also passes checks on **0.164.0**.
All templates and frontend assets are included in this repository.
On my Mac, you
can just run:

    brew install hugo
    make

And you should get all the pages generated in the `public` subdirectory.

If you want to run the web server to view the pages as you edit them, you can run:

    make serve

And it should fire up a web server on http://localhost:1313/ that you can use to look
at the pages as you edit them.

Run `make check` to build in a fresh temporary directory and verify feeds,
legacy URLs, historical tutorial links and assets, resume styles, shortcodes,
game pages, and isolated fallback templates. Warnings fail the check.
Shared pages use focused native CSS; checks reject Bootstrap/Bootswatch and
jQuery runtime includes while preserving their historical asset URLs.
To use a separate Hugo binary,
run `make check HUGO=/absolute/path/to/hugo`.

See [the Hugo upgrade notes](docs/hugo-upgrade.md) for the migration details,
remaining issues, and the consolidation into a standalone repository.
