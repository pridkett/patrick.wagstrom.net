---
date: '2010-02-04T21:38:00-05:00'
old:
  layout: post
  oldcategories:
  - python
  status: published
  timestamp: 09:38 PM Thursday, February 04, 2010 EST
  wordpress_id: '835'
oldtags:
- automation
- cv
- google
- html
- python
- resume
- sites
slug: command-line-updating-pages-on-google-sites
tags:
- google
- cv
- resume
- python
- html
- sites
- automation
title: Command Line Updating Pages on Google Sites
url: /weblog/2010/02/04/command-line-updating-pages-on-google-sites/
---

About eighteen months ago I migrated [my academic web pages](http://academic.patrick.wagstrom.net/) away from a self hosted solution on a Linux box in my living room to [Google Sites](http://sites.google.com/).  Mainly this was done because I was applying for jobs and wanted to make sure that the site would be reliable.  But although I came for the reliability, I stayed for the features.

It's true that Google Sites is somewhat limiting in what you can do.  You can't do fun stuff with [jQuery](http://jquery.com/) and highly customized CSS is verboten.  It's not going to work for someone who needs to share a design portfolio.  However, for an academic it works really well.  Basically, I need a set of pages about [my research](http://academic.patrick.wagstrom.net/), [copies of my papers](http://academic.patrick.wagstrom.net/publications) and [presentations](http://academic.patrick.wagstrom.net/presentations), and various forms of [my résumé](http://academic.patrick.wagstrom.net/resume) and [cv](http://academic.patrick.wagstrom.net/cv).  These are all typically boring pages that can be created with some simple HTML.  Google Sites manages that and even helps them look good too.

At that time I also realized that I needed to be a bit more flexible in how I handled my resume and CV.  Up until this point I had a highly customized LaTeX file that generated a very pretty PDF.  The beauty was only skin deep, underneath the PDF it was ugly, difficult to maintain, and if I wanted to paste portions of the document in to an email or someone requested a word document version, I was out of luck.

At the time I still hadn't gotten [my head on straight regarding how XML should never be used by humans](http://patrick.wagstrom.net/weblog/2009/11/25/shutting-down-pennave/), so I chose the [XML Résumé Library](http://xmlresume.sourceforge.net/), an Open Source package that hasn't been updated in a couple of years.  The library consists of an XML DTD that defines elements of a resume and a set of XSLT files that translate your resume into various formats, including text, html, and FO.  I can then use the FO files to generate PDF, DOCX, and ODT files.  Simple enough. Now I have a single source document with a Makefile that compiles the file into both my résumé and cv.

The problem is that I provide each document in five different formats, which means that I needed to upload 10 documents every time that I changed something.  This was not ideal at all.

Luckily, Google is in the process of making open APIs for all of their tools and last September they finally released the [Google Sites API](http://code.google.com/apis/sites/).  It still isn't 100% complete, but with the [2.0.7 release of the python libraries](http://code.google.com/p/gdata-python-client/) it is finally to the point where the python library is suitable for updating documents.

I whipped up a simple little python script that uploads files from the command line to Google Sites.  It only works with documents that have previously been uploaded by hand, so in that sense, it only updates documents.  You can find [site_uploader.py as a github gist](http://gist.github.com/295408) or it should be embedded below.



The script itself has only been tested on apps for domains and has a couple of mandatory options:

  * **-s/--site**: The name of the site to update.  This isn't the URL, but the name in your admin panel for the site.
  * **-d/--domain**: The domain name of your apps for domain setup.  I'm not certain what happens if you don't include this because all of my sites are hosted through Apps for Domains.
  * **-u/--user**: The username to use for accessing the Google Sites API.
  * **-p/--pass**: The password for the user account. The sites API provides multiple different authentication methods.  For my own convenience I have my Makefile prompt me for a password with Zenity then invoke the script.  I'm on a laptop which means the chance of someone else seeing my password in the process list is pretty slim.
  * **ENTRY_ID**: each document on your site has an entry_id that doesn't change with updates.  Think of it like a UUID.
  * **NEW_DOCUMENT**: the filename of the new document to store on Google sites.

When you're first getting started with sites_uploader you can also use the **--list** option to get a list of all the documents on the site and their entry_id values.  Here's what a simple session might look like:


        patrick@wallaby$ python sites_uploader.py -s "dummy" -d "wagstrom.net" -u "patrick@wagstrom.net" -p "PASSWORD" --ssl --list
        ["attachment.png", "attachment", "https://sites.google.com/feeds/content/wagstrom.net/dummy/9999384153430219999"]
        ["Home", "webpage", "https://sites.google.com/feeds/content/wagstrom.net/dummy/9999953700077559999"]
        ["files", "filecabinet", "https://sites.google.com/feeds/content/wagstrom.net/test/9999182398032899999"]
        patrick@wallaby$ python sites_uploader.py -s "dummy" -d "wagstrom.net" -u "patrick@wagstrom.net" -p "PASSWORD" --ssl https://sites.google.com/feeds/content/wagstrom.net/dummy/9999953700077559999 home.html


This examines the site "dummy" under "wagstrom.net" by first listing all the documents, of which there are three: a png file called "attachment.png", a webpage called "home", and a filecabinet called "files".  We note the id of the webpage called "home" and wish to replace its content with that of home.html.  When an operation is successful it prints out nothing.

The beauty of using id's is that they don't change, so once you look them up and put them into your Makefile, you'll never need to change them again.  The other nice thing about Google Sites is that it sanitizes your HTML, so you can feed it a complete HTML file and it is smart enough to just take the part that belongs in the body of the document.  Pretty neat stuff indeed.

The code for the tool should be pretty straight forward, but folks have questions feel free to email me and I'll attempt to answer.