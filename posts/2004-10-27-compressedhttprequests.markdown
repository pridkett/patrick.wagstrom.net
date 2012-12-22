title: Compressing HTTP Requests
timestamp: 10:53 AM Wednesday, October 27, 2004 EDT
status: published
slug: compressedhttprequests
tags:
- meta
url: /weblog/2004/10/27/compressedhttprequests/

layout: post
oldcategories:
- meta
wordpress_id: '129'

---

On my quest playing with compression of HTTP stuff, I found out today that it is possible
to compress the request to a server in addition to the response.  While for most cases this
wouldn't matter much, as requests are small, for web-dav clients this can be a very big
deal.  Basically the difference is that a client sends an additional header that says
Content-Encoding: gzip to the server (this also means they need
to seend a Content-Length header too) and the server if it
can handle that will automatically upack the body of the request.  Wow, that's just cool.

