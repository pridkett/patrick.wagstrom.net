---
date: '2003-11-22T20:00:00-05:00'
old:
  layout: post
  oldcategories:
  - web
  status: published
  timestamp: 08:00 PM Saturday, November 22, 2003 EST
  wordpress_id: '226'
slug: transformiixrant
tags:
- web
title: A Rant on Transformiix
url: /weblog/2003/11/22/transformiixrant/
---

I've been having a good time taking advantage of the Transformiix XSLT processing engine that is part of the newer
versions of [Mozilla](http://www.mozilla.org/).  However, I think I finally ran into something that it breaks
on.  Here's what's going on.  I'm dynamically generating some graphics and need to output an imagemap with them.  The
initial plan was to plunk the imagemap that I generate from [neato or dot](http://www.graphviz.org/) as a chunk
of CDATA.  The problem is that transformiix ALWAYS escapes the output.  It
seems to completely ignore the [disable-output-escaping](http://www.zvon.org/xxl/XSLTreference/Output/xslt_text_disable-output-escaping.html)
attribute.  So needless to say, this annoys me as it works fine with xsltproc.






My options were either have the server do the XSLT transformation or hack a way around it.  I chose the latter.  The first problem was
that the imagemaps spit out by dot and neato aren't valid as they look like this:


    <area shape="rect" href="vendor.py?id=317" title="OpenSSH" alt="OpenSSH" coords="441,436,569,495">


Now to fix that I need to add the "/" to the end of it.  So it was back to hacking the code on Graphviz (which I already had
to do for it to compile on [Fedora](http://fedora.redhat.com/)).  Then I fixed that.  Now the problem was
I needed to make new nodes out of all these area tags.  The solution was to create another XML document in memory and transfer
the node over.  This is probably not the most efficient, but it seems to work:





        cmap = graphviz.renderGraph(buildGraph(vendorInfo,vulns), format="cmap", engine="neato")
        cmap = """<?xml version="1.0"?>\n<imagemap>\n%s</imagemap>""" % cmap
        imageMapDoc = libxml2.parseDoc(cmap)
        mapNode = imageMapDoc.children
        mapNode.setNs(myNS)
        imageNode.addChild(mapNode)






Probably not the most useful out of context but I'll sum it briefly.  So the first line makes the call that returns all of
the area tags as a string.  The next line creates a dummy XML document while the third line parses
it.  The fourth selects the <imagemap> node.  The fifth sets the right namespace and finally the
sixth dumps it back it.  Then I can process all the nodes individually using the XSLT.  It's sweet.  If only I could have
done it the easy way with a chunk of Cdata though.
