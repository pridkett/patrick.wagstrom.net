#!/usr/local/bin/python

import cgi
import cgitb; cgitb.enable()
import config
import time
import string
import os
import sys

def print_redirect(url):
	print 'Status: 302 Moved Temporarily'
	print 'Location:', url
	print 'Pragma: no-cache'
	print 'Content-Type: text/html'
	print

	print '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML//EN">'
	print '<title>Redirect (302)</title>'
	print '<h1>302 Moved Temporarily</h1>'
	print '<p>The answer to your request is located at'
	hurl = cgi.escape(url, 1)
	print '<a href="%s">%s</a>.' % (hurl, hurl)
	sys.exit()

def print_error(errorMessage):
	print "Content-Type: text/html"
	print
	print "<html><head><title>Error Processing comment</title></head><body><h2>%s</h2>Please use the back feature of your browser and correct this error</body></html>" % (errorMessage)
	print
	sys.exit()

def processComment():
	global form
	form = cgi.FieldStorage()
	try: name = form["yourName"].value.replace("&","&amp;").replace("<","&lt;").replace(">","&gt;")
	except: name = ""
	try: url = form["url"].value.replace("&","&amp;").replace("<","&lt;").replace(">","&gt;")
	except: url = ""
	try: email = form["email"].value.strip().replace("&","&amp;").replace("<","&lt;").replace(">","&gt;")
	except: email = ""
	try: body = form["commentBody"].value.replace("&","&amp;").replace("<","&lt;").replace(">","&gt;").strip().replace("\n","<br/>\n")
	except: body = ""
	try: answer = int(form["answer"].value)
	except: answer = None
	returnPage = form["storyURL"].value
	story = form["story"].value

	if answer != 3:
		print_error("""Sorry Spammy McSpamalot.  That's not an acceptable answer.  Try again!""")
	if len(name) < 3:
		print_error("""Your name, which was given as "%s", surely must be more than %d characters.""" % (name, len(name)))
	if ('@' not in email) or  ('.' not in email) or (email[-1] not in string.letters):
		print_error("""Even my basic email validity checking can tell that "%s" is not a real email address.""" % (email))
	if len(body) < 2:
		print_error("""I'd hope if you had something to say, it's more substantial than "%s".""" % (body))
	if len(body) > 32000:
		print_error("""I've set an arbitrary limit on the size of comments in my blogs.  You've exceeded that.  Reduce the size of your comment and try again.""")

	baseDir = config.py['commentdir']+os.sep+story
	baseFileName = baseDir+os.sep+str(int(time.time()))

	if not os.path.exists(baseDir):
		os.makedirs(baseDir)

	f = open(baseFileName + ".email","w")
	f.write(email)
	f.close()

	outValue = """<my:comment>\n<my:author>%s</my:author>\n""" % (name)
	if url:
		outValue += "<my:url>%s</my:url>\n" % (url)
	outValue += "<my:commentTime>%s</my:commentTime>" % (time.strftime("%B %d, %Y at %H:%M"))
	outValue += "<my:body>%s</my:body>\n</my:comment>" % (body)
	f = open(baseFileName+".txt","w")
	f.write(outValue)
	f.close()

	print_redirect(returnPage)

if __name__ == "__main__":
	processComment()
