---
date: '2010-03-03T14:33:00-05:00'
old:
  layout: post
  oldcategories:
  - academic
  status: published
  timestamp: 02:33 PM Wednesday, March 03, 2010 EST
  wordpress_id: '861'
oldtags:
- academic
- acm
- style
- zotero
slug: acm-sigs-style-for-zotero
tags:
- academic
- style
- acm
- zotero
title: ACM SIGS Style for Zotero
url: /weblog/2010/03/03/acm-sigs-style-for-zotero/
---

Academics live and die based on references. A variety of tools exist to manage references, from the sadly ubiquitous [EndNote](http://www.endnote.com/), to manually curated [BibTeX](http://www.bibtex.org/) files, to some people who just type their entries by hand with each paper. A variety of web aware citation management tools are also available, for example [Mendeley](http://www.mendeley.com/) and [Zotero](http://www.zotero.org/).

For the past few years I've been using Zotero and have found it to be wonderful (with a few slight exceptions). It lives inside of Firefox and provides one click functionality to add a reference to my database and synchronize the change across computers automagically. It has good plugins for Microsoft Word and OpenOffice to provide citation management on a level that is similar to what one gets on EndNote. It also supports BibTeX export (with some slight key naming issues).

Unfortunately, almost every journal and conference wants slightly different formatting for their references. Zotero can handle this through the use of style files crafted in the [Citation Style Language (CSL)](http://xbiblio.sourceforge.net/csl/). I had noticed that my submission to [ICSE 2010](http://www.sbs.co.za/ICSE2010/) was dinged because I had the citations in the wrong format -- apparently I was mistaken and thought they used SIGCHI reference formatting, when in fact they use ACM SIGS reference formatting. Sadly, Zotero doesn't have a style for formatting ACM SIGS references, until now. While finishing up [my paper on supporting stakeholders in enterprise software projects](https://sites.google.com/a/wagstrom.net/academic/publications/Williams_2010_SupportingEnterpriseStakeholdersInSoftwareProjects.pdf?attredirects=0&d=1) for the [CHASE 2010](http://www.itu.dk/people/ydi/CHASE2010.html) workshop I decided it would be easier to bite the bullet and just write my own style that fits the specification.  I don't claim that the style is complete, but it seems to work well enough.  You can find the style [hosted as a GitHub gist](http://gist.github.com/320873), an I've also embedded the file below. If you're using Zotero you'll need to download the raw file then drag it into Zotero where the style will be installed and you'll now see ACM SIGS as an option for reference formatting.  Feel free to fork it and improve the formatting. In case the embed does not show up, please visit [http://gist.github.com/320873](http://gist.github.com/320873) instead.

<!-- GitHub Gist: 320873 -->
<script src="https://gist.github.com/320873.js"></script>
