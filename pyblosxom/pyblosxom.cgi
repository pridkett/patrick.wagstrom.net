#!/usr/bin/python
# vim: shiftwidth=4 tabstop=4 expandtab
"""pyblosxom
A Bloxsom clone in python, see http://www.raelity.org/apps/blosxom/ for details
"""
# Uncomment this if you put Pyblosxom directory outside of pyblosxom.cgi
import sys
sys.path.append('/home/patrick/Documents/www/pybloxsom/')
# Uncomment this if something goes wrong (for debugging)
#import cgitb; cgitb.enable()

# Settings are now in config.py, you should disable access to it by htaccess
# (make it executable or deny access)
import config

__author__ = 'Wari Wahab <wari@wari.per.sg>'
__version__ = config.py['pyblosxom_version']
__date__ = "$Date: 2003/12/10 19:46:35 $"
__revision__ = "$Revision: 1.2 $"
__copyright__ = "Copyright (c) 2003 Wari Wahab"
__license__ = "Python"

if __name__ == '__main__':
    from Pyblosxom.pyblosxom import PyBlosxom
    from Pyblosxom.Request import Request
    import os, cgi

    req = Request()
    req.addConfiguration(config.py)

    d = {}
    for mem in ["HTTP_HOST", "HTTP_USER_AGENT", "HTTP_REFERER", "PATH_INFO", 
            "QUERY_STRING", "REMOTE_ADDR", "REQUEST_METHOD", "REQUEST_URI", 
            "SCRIPT_NAME", "HTTP_IF_NONE_MATCH", "HTTP_IF_MODIFIED_SINCE", "HTTP_ACCEPT_ENCODING"]:
        d[mem] = os.environ.get(mem, "")
    req.addHttp(d)

    req.addHttp({"form": cgi.FieldStorage()})

    p = PyBlosxom(req)
    p.startup()
    p.run()
