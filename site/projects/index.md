<#header Projects>

GitMiner
========

GitMiner is a tool that crawls all of the data avaialble from the [GitHub public API][ghapi] to build a complete picture of the contents of a set of projects. It was originally developed
for a joint research project with the University of Nebraska - Lincoln, and has since been expanded dramatically. As of August 2013 more than 20 academic institutions from around the world
had used GitMiner as part of their academic research program.

GitMiner is an open source project released under the Apache License and can be obtained through the [GitMiner project page at GitHub][gitminer]

gitminer-data-rails
-------------------

Scraping data for GitMiner can be quite difficult and time consuming. In order to make the process easier for new researchers I worked with Anita Sarma and Corey Jergensen at the University of Nebraska-Lincoln to download data for over 1100 different projects related to [Ruby on Rails][rails].

This is an open sourc dataset distributed as a [neo4j database][neo4j]. It is released under the Apache License and can be obtained through the [gitminer-data-rails project page at GitHub][gitminer-data-rails].

dc2uddf
=======

A fairly simple tool that connects to any dive computer supported by [libdivecomputer][libdivecomputer] and exports the collection of dives as a [UDDF file][uddf]. This was originally designed because I use a Mac as my day to day computer, but unfortunately, my dive computer connects via IrDA, which is not supported on Macs. Using this tool I can download the dives through a Linux virtual machine and then import the dives into [MacDive][macdive].

I wrote a fairly long blog entry about the creation of dc2uddf that describes the challenges with the solution which provides additional background information.

dc2udff is an open soruce project released under the Apache License and can be obtained through the [dc2uddf project page at GitHub][dc2uddf].

<#footer>

[gitminer]: https://github.com/pridkett/gitminer
[gitminer-data-rails]: https://github.com/pridkett/gitminer-data-rails
[dc2uddf]: https://github.com/pridkett/dc2uddf
[uddf]: http://uddf.org/
[macdive]: http://www.mac-dive.com/
[libdivecomputer]: http://www.libdivecomputer.org/
[neo4j]: http://www.neo4j.org/