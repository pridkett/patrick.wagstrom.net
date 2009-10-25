#!/usr/bin/python

import os
import time
import datetime

def sortbydate(infiles):
	"""Sort the images by their dates as encoded in the files"""
	outfiles = []
	for thisfile in infiles:
		base = os.path.splitext(thisfile)[0]
		try:
			year, month, day = int(base[0:4]), int(base[4:6]), int(base[6:8])
			outfiles.append(tuple([thisfile, datetime.datetime(year, month, day)]))
		except:
			continue
	outfiles.sort(cmp=lambda x,y: cmp(x[1],y[1]))
	return outfiles

files = sortbydate([x for x in os.listdir('shots') if x.endswith(".jpg") or x.endswith(".png")])
files.reverse()

print "Content-Type: text/html"
print """
<html>
	<head>
		<title>Patrick's Screenshots</title>
    <!-- GOOGLE Analytics Stuff -->
    <script type="text/javascript">
      var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
      document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
    </script>
    <script type="text/javascript">
      var pageTracker = _gat._getTracker("UA-3441054-1");
      pageTracker._initData();
      pageTracker._trackPageview();
    </script><!--End Google Analytics -->
	</head>
<body>
<h1>Patrick's Screenshots</h1>
<p>Yup, right now this page is kinda ghetto.  Sometime I'll end up making it a bit
more sexy.  But for right now, this is what you get.  All part of my conquest to
banish all PHP from my website.</p>
<ul>
"""

for filename, filedate in files:
	base = os.path.splitext(filename)[0]
	try:
		desc = open("desc/%s.txt" % (base)).read()
	except:
		desc = ""
	print """<li><a href="shots/%s">%s</a><br/>""" % (base, filedate.strftime("%A, %B %d, %Y"))
	print """<table border="0" cellpadding="2" cellspacing="0">
<tr><td><a href="shots/%s"><img src="thumbs/%s"/></a></td><td>%s</td></tr>
</table></li>""" % (filename, filename, desc)

print "</ul></body></html>"
