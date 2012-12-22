title: XSLTRenderer Plugin
timestamp: 11:02 PM Wednesday, October 29, 2003 EST
status: published
slug: xsltrendererintro
tags:
- meta
url: /weblog/2003/10/29/xsltrendererintro/

layout: post
oldcategories:
- meta
wordpress_id: '125'

---

I've created a first rough go at an XSLT renderer for pyblosxom.  It's not perfect, but it's not horrible either.  I need to figure out how to get the flavor of the of
the request before entering the renderer.  I don't want the XSLT renderer to be used except on certaint flavor requests, which causes problems becaues right now it is
being used on all flavor requests.  If you're using an XSLT browser this makes no difference, but if you're using a non-xslt browser I'd imagine that it would break
a lot of the files.  Oh well, not a major concern right now.  You can find the link to the plugin on my [projects page](/projects/).

