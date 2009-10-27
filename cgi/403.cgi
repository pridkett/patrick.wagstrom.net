#!/usr/local/bin/python
import os
import datetime
try:
	remote = os.getenv("REMOTE_ADDR")
	ok = True
	if len(remote.split(".")) != 4:
		ok = False
	if len([x for x in remote.split(".") if len(x) > 0 and len(x) < 4 and int(x) >= 0 and int(x) < 256]) != 4:
		ok = False
	if ok:			
		f = os.popen("sudo pfctl -t http_banned -T add %s" % os.getenv("REMOTE_ADDR"))
		body = f.read()
		f.close()
except:
	body = ""

print """Content-Type: text/html

<body><body><h1>403 Forbidden</h1><p>You suck</p><pre>%s</pre><p>You've probably reached this
page because you gave a referer address that sounds or is a link spammer.  Go away, stop
wasting my bandwidt.  If you believe that you've reached this message in error, email me
and I'l fix it.  If you can't figure out my name from the domain name, you're an idiot.  Go
away.</p></body></html>""" % body

try:
	f = open("/home/patrick/Documents/www/cgi/ipaddr.banned","a")
	f.write("Host=[%s] Referer=[%s] URI=[%s] Agent=[%s] Time=[%s]\n" % (os.getenv("REMOTE_ADDR"),
                                                                            os.getenv("HTTP_REFERER"),
	                                                                    os.getenv("REDIRECT_URL"),
	                                                                    os.getenv("HTTP_USER_AGENT"),
	                                                                    datetime.datetime.now()))
	f.close()
except:
	pass
