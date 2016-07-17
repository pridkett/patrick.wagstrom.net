---
date: '2004-12-10T11:35:00-05:00'
old:
  layout: post
  oldcategories:
  - meta
  status: published
  timestamp: 11:35 AM Friday, December 10, 2004 EST
  wordpress_id: '135'
slug: banninglinkspammers2
tags:
- meta
title: Really Banning Link Spammers
url: /weblog/2004/12/10/banninglinkspammers2/
---

Realizing that I shouldn't be content with just sending out
[403 codes to link spammers](/weblog/meta/banningLinkSpammers.txt), I
decided to get a little more devious.  I've now hooked up a CGI to
handle the 403 errors.  What's even better, it hooks into pfctl on
[OpenBSD](http://www.openbsd.org/) to dynamically ban the people as
they hit the site.  You can't ask for much better than that.  Well, we
could be talking about integrating some layer 7 stuff here, but I
digress.

So, first there is some work that needs to be done in the httpd.conf
file that configures the server.  This is shown below:

    :::apache
        ErrorDocument 403 /cgi-bin/403.cgi

        # provide a method to test the blocker
        RewriteCond %{QUERY_STRING} ^deny=true$
        RewriteRule !^/cgi-bin/403.cgi$ - [F]

        # all the referrers we don't like
        RewriteCond %{HTTP_REFERER} ^http://(www\.)?.*(-.*)+\.info/.*$ [NC,OR]
        RewriteCond %{HTTP_REFERER} ^http://(www\.)?adminshop.com/.*$ [NC,OR]
        RewriteCond %{HTTP_REFERER} ^http://(www\.)?webdevboard.com/.*$ [NC,OR]
        RewriteCond %{HTTP_REFERER} ^http://(www\.)?devaddict.com/.*$ [NC,OR]
        RewriteCond %{HTTP_REFERER} ^http://(www\.)?whiteguysgroup.com/.*$ [NC,OR]
        RewriteCond %{HTTP_REFERER} ^http://(www\.)?guestbookz.com/.*$ [NC,OR]
        RewriteCond %{HTTP_REFERER} ^http://(www\.)?xopy.com/.*$ [NC]
        RewriteRule !^/cgi-bin/.*$ - [F]

        # Ban comment spammers
        # This stops people who try to write scripts to comment spam me
        RewriteCond %{HTTP_REFERER} ^-?$
        RewriteRule ^/mt/mt-comments.cgi$ - [F,L]


In a nutshell, I've done a cople of things.  First, I've sent all 403
error statements through the CGI.  Next, I've modified it so I can
test the system by allowing me to append "?deny=yes" to any URL and
get the 403 error page (and thus blocked).  After that, we've got a
section blocking all the referrers that I don't like.  Finally, I've
decided to stop people who are still trying to hit my MovableType
system that's been dead for well over a year now.

The next step is to modify your `/etc/pf.conf` file to allow for the
blocking.  The new rules are shown below:


        table <http_always_allowed> { 192.168.1.0/24 }
        table <http_banned> persist
        web_ports = "{ 80 }"

        pass in quick proto tcp from <http_always_allowed> to any port $web_ports keep state
        block in quick proto tcp from <http_banned> to any port $web_ports


This creates two tables.  One contains a list of all hosts that are
allowed no matter what to hit the web server.  Put your testing host
in here or you'll get blocked.  The second tells the system to create
a table called http_banned that contains banned ip addresses.  Next,
we set up web_ports as a listing of ports the web server runs on.
Finally, we create a rule to allow the people in the
http_always_allowed table to always connect and the final rule blocks
all connects from http_banned hosts.

If you've gotten this far, you're doing well.  Now we need to create
the CGI to make sure it can ban people.  Here is my version of
`/cgi-bin/403.cgi` that I use on my site:

    :::python
    #!/usr/local/bin/python
    import os
    import datetime
    try:
    	f = os.popen("sudo pfctl -t http_banned -T add %s" % os.getenv("REMOTE_ADDR"))
    	body = f.read()
    	f.close()
    except:
    	body = ""
    print """Content-Type: text/html

    <body><body><h1>403 Forbidden</h1><p>You suck</p><pre>%s</pre></body></html>""" % body

    try:
    	f = open("/tmp/ipaddr","a")
    	f.write("Host=[%s] URI=[%s] Agent=[%s] Time=[%s]\n" % (os.getenv("REMOTE_ADDR"),
    	                                                       os.getenv("REDIRECT_URL"),
    	                                                       os.getenv("HTTP_USER_AGENT"),
    	                                                       datetime.datetime.now()))
    	f.close()
    except:
        pass


You'll notice one little problem, this guy calls sudo in order to
block the port.  That means we need to allow the web user to call
pfctl.  This is probably not a good idea for a multi user system.  A
better idea is to write a wrapper program which ONLY adds entries to
the list of banned clients.  If you've gotten this far, you can
probably figure out how to do that on your own.

The very last step is to allow the web server to call sudo for pfctl.
Here are the lines that I have in my `/etc/sudoers` to allow this to
happen.


        Cmnd_Alias WEB = /sbin/pfctl
        www     ALL=(ALL) NOPASSWD: WEB


Putting all of these things together should get your system up and
going.  Now you can come back in a little while and look and see who
has been banned from your server.  It's oh so delicious!  Have fun and
enjoy banning bastards.  This method could be easily extended to ban
bots that hit unauthorized pages or whatever you want.  Just remember,
autobanning like this is a sure fire way to lock yourself out of your
system.  Don't blame me for your problems.

<pre>
    [patrick@scissors] <b>sudo pfctl -t http_banned -T show</b>
       80.58.11.107
       196.20.31.121
</pre>