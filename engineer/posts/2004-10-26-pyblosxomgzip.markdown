title: Weblog is now Gzip Encoded
timestamp: 10:57 AM Tuesday, October 26, 2004 EDT
status: published
slug: pyblosxomgzip
tags:
- meta
url: /weblog/2004/10/26/pyblosxomgzip/

layout: post
oldcategories:
- meta
wordpress_id: '149'

---

After my [rant about bandwidth saving](http://patrick.wagstrom.net/weblog/code/python/feedParsing.xml)
from last night, I decided to do what I could with my install of PyBlosxom.  Unfortunately, it's going to be
difficult to implement the if-modified-since directive with how PyBloxsom is built,
however, I knew it couldn't be that hard to work around the Gzip stuff.  Basically, all the encodings a client
can accept are stored in an environment variable HTTP_ACCEPT_ENCODING.  This will
contain a string something like gzip,deflate.  What I do is break apart the string,
and if gzip is found in the string, I encode the data.






Of course, it wasn't quite that straight forward.  Luckily, I already was using a
[customized PyBlosxom renderer](/weblog/meta/xsltRendererWithLibXSLT.xml), which made this a little
easier.  This renderer now handles all the gzip stuff.  If a client support gzip, then the output stream is
automatically changed to sys.stdout and the data is sent out that way to avoid
nasty encoding problems.  Also, I needed to add a content-length to the output
so everything would come across nice and neat for the clients unpacking the data.  The result is pretty nice.






Incidentally, this is needed because by I couldn't figure out how to get Apache's [mod-gzip](http://www.sourceforge.net/projects/mod-gzip) to compress output of CGI scripts.  Once again, whenver I get around to completing
all the work on [PriBlog](/weblog/code/priblog), I don't think this will be much of a problem because most
of the content will be statically generated.

