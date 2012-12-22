title: 24 Hour Blog Challenge Update
timestamp: 03:41 PM Saturday, January 05, 2008 EST
status: published
slug: 24hrblogchallenge-update
tags:
- weblog
- code
- 24hrblogchallenge
- xslt
- python
url: /weblog/2008/01/05/24hrblogchallenge-update/

layout: post
oldcategories:
- code
oldtags:
- 24hrblogchallenge
- code
- python
- weblog
- xslt
wordpress_id: '302'

---

First of all, I cheated a little, it's been 24 hours and 51 minutes since I started my little challenge yesterday afternoon.  I started with no code written, no database schema, and no HTML templates.  As of right now, I have a system that has accomplished all of the goals set forth in the original [24 Hour Blog Challenge](/weblog/code/24hrBlogChallenge/) post, but is really ugly.  Along the way, I also did some nifty things that I'd like to share.

The PyBlosxom blog setup uses lots of XSLT to create the web pages, this works okay, but isn't ideal at all.  Also, it makes it really hard to get myself loose of the XSLT.  I was originally going to get rid of it all together, but then I realized that I liked being able to define a few of my own tags and having a translator convert them to HTML.  Within the new software, entries are written in as standard text, and then passed through a series of translators, which can be simple things like cleaning up the HTML with [Beautiful Soup](http://www.crummy.com/software/BeautifulSoup/), running an XSLT processor, or syntax highlighting bits of source code in the document.  These are chained together to get some nice results, but when importing and exporting data, you're still working with the original.

The same technology applies to comments.  This way I can allow users to use HTML code in their comments, but use XSLT to filter out code that they shouldn't be using.  I can specify some pretty precise terms too, like not allow images bigger than 200 pixels or something silly like that.  Because I run the comments through BeautifulSoup beforehand, it usually  guarantees that we'll get a usable output from the comment. In the future, this will allow users to embed code in comments and have it highlighted in the same way as my code is.  The translation is only done at creation time, so it's minimal load to the system to have this feature.

Anyway, that's the neatest feature.  Once I get some better style sheets, I'll see about replacing the current PyBlosxom infrastructure with the new system.
