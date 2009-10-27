#!/usr/bin/env python
"""
This handy little script fixes file dates.  It opens up the file
and if there is a line that looks like this:
<!-- Date: YYYY-MM-DD HH:MM -->
It will set the mtime of the file to the date listed there.  It's
very nice for pyblosxom which bases ordering off the mtime of the
file.  It's also great for when CVS decides to randomly change
your file dates.

By Patrick Wagstrom <wagspat@iit.edu>

Released under terms of the GNU General Public License Version 2

$Revision: 1.1 $
$Id: fixfiletime.py,v 1.1 2004/04/10 02:47:55 patrick Exp $
"""
import os, time, sys


def fixFileTime(filename):
	try:
		filestats = os.stat(filename)
	except:
		print "File not found.  Quitting."
		sys.exit(1)

	print "Processing File: ", filename
	try:
		filebody = open(filename)
	except:
		print "Cannot open file %s - exiting" % (filename)
		sys.exit(1)
	
	body = [x.strip() for x in filebody.readlines() if x.lower().startswith("<!-- date:")]
	filebody.close()
	
	if len(body) > 1:
		print "I'm confused, multiple line matches!"
		print body
		sys.exit(1)
	if len(body) == 0:
		print "No match"
		return
	
	newdate = body[0].split()
	timetuple = time.strptime(newdate[2]+" "+newdate[3],"%Y-%m-%d %H:%M")
	newmtime = time.mktime(timetuple)
	
	filestats = os.stat(filename)
	atime, mtime = filestats[7:9]
	print "Old mtime: ", time.asctime(time.localtime(mtime))
	print "New mtime: ", time.asctime(time.localtime(newmtime))
	
	try:
		os.utime(filename, (atime, newmtime))
	except Exception, e:
		print "Failed to set the new time.", e
		print "Quitting."
		sys.exit(1)


if len(sys.argv) < 1:
	print "Usage: fixfiletime.py filename [filename2 ...]"
	sys.exit(1)

for mem in sys.argv[1:]:
	fixFileTime(mem)
# filename = sys.argv[1]
