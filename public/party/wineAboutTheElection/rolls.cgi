#!/usr/bin/python

import register

conn, cur = register.db_connect()
print """Content-type: text/html\n\n

<html>
    <head><title>List of Registered Voters</title></head>
<body>
%s
</body>
""" % (register.voterrolls(conn, cur))

