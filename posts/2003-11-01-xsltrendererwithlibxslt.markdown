title: XSLTRenderer Now Uses libxslt
timestamp: 09:16 PM Saturday, November 01, 2003 EST
status: published
slug: xsltrendererwithlibxslt
tags:
- meta
url: /weblog/2003/11/01/xsltrendererwithlibxslt/

layout: post
oldcategories:
- meta
wordpress_id: '152'

---

I've hacked together code so the XSLTRenderer plugin can now use
libxslt to do the transformations on the server
side.  This should be more efficient than shelling out to
xsltproc all the time.  If I hack away on [modpython](http://www.modpython.org/) stuff tomorrow then I might see about getting it
to cache the already read stylesheet in memory.  This would reduce another disk read and make server side rendering even faster.  Yay.






Also, I haven't heard of anyone else who is using it.  I had a few people download copies of it, but no emails
about it yet.  I'll submit it to the pyblosxom plugins page after I do a bit more testing of it.  In the mean
time feel free to email me about it.  You can download the new version from my [projects](/projects/) page.

