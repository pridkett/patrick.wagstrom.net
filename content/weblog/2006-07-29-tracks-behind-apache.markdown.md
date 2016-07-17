---
date: '2006-07-29T01:46:00-04:00'
old:
  layout: post
  oldcategories:
  - web
  status: published
  timestamp: 01:46 AM Saturday, July 29, 2006 EDT
  wordpress_id: '231'
oldtags:
- apache
- gtd
- howto
- proxy
- ruby
- rubyonrails
- tracks
- tutorial
- web
slug: tracks-behind-apache
tags:
- web
- gtd
- rubyonrails
- howto
- tracks
- proxy
- apache
- ruby
- tutorial
title: Tracks behind an Apache 2 Proxy on OpenBSD
url: /weblog/2006/07/29/tracks-behind-apache/
---

Like most geeks, I suffer from a profound lack of an ability to get things done.  I've read a lot of the stuff on [43 folders](http://www.43folders.com/) and even thought about trying a few, but never really got around to it.  Yes, I'm that bad at getting things done.  One of these days, I may actually buy [David Allen's book _Getting Things Done_](http://www.amazon.com/gp/product/0142000280/).  But for right now, I look at the fact that I'd have to pay shipping on it from Amazon and I say no.

I feel good to know that I'm not alone. [Kenneth](http://kenneths.org/flog/) also suffers from the same issues, at times it appears that Pridjano Enterprises is better at being a support group for slackers than it is at changing the world.  However, today, something different hit my radar.  [Luis Villa](http://tieguy.org/blog/), GNOME bugmaster extraordinaire, and overall really helpful guy made a [weblog entry about switching form trac to tracks for GTD](http://tieguy.org/blog/2006/07/27/from-trac-to-tracks-for-gtd/).  I was intrigued.  I had never thought about using Trac to manage my GTD in the first place, I guess it could be used, but it wasn't designed for such and application from the ground up, thus it had some rougher edges when used for GTD.  After some poking around, I saw that [Tracks](http://www.rousette.org.uk/projects/) looked like a pretty cool webapp.  One problem, it runs on Ruby on Rails. Ouch.  I had managed to stay away from Ruby on rails for quite a long time, it was time to give in.

First of all, [Ruby](http://www.ruby-lang.org/) is a lot like [Python](http://www.python.org/) and [Perl](http://www.perl.org/).  From what I can tell, it's about halfway between the two languages.  I don't see any clear advantage to using it, other than it doesn't enforce the spacing requirements of Python, which is the major complaint I hear from people who have never used Python. Rails is a model, view, container sorta setup for developing web applications. It's supposed to be pretty cool and pretty slick to develop apps with.  If you haven't seen the [15 minute weblog on Rails movie](http://www.rubyonrails.org/screencasts), I highly recommend it.  Pretty slick.  However, like many of the other frameworks such as [CherryPy](http://www.cherrypy.org/), [TurboGears](http://www.turbogears.org/), and [Django](http://www.djangoproject.com/), the framework requires a specialized and dedicated web server.  Well, not exactly, but most everyone runs it like that.  It was either that, or run it using [FastCGI](http://www.fastcgi.com/), which I'm not about to touch.

So, now the issue is, if it requires it's own personal web server, it probably doesn't support encryption, right?  If I'm storing my task list on there and accessing it from a [frequently sniffed unencrypted wireless network](http://www.cmu.edu/computing/wireless/), I certainly want  SSL/TLS encryption, which the [Lighttpd](http://www.lighttpd.net/) that ships with [Ruby on Rails](http://www.rubyonrails.com/) probably doesn't support (note: I haven't 100% checked the previous statement for it's truthiness). I knew that I could easily do some proxying, after all, I currently have my installation of [MythWeb](http://www.mythtv.org/wiki/index.php/MythWeb) running behind such a proxy with little difficulty.  So this shouldn't be hard.

The first step was installing [Ruby](http://www.ruby-lang.org/) and [Ruby-Gems](http://rubyforge.org/projects/rubygems/) onto my [OpenBSD](http://www.openbsd.org/) server.  Ruby is already in ports so it was a simple matter of running cd /usr/ports/lang/ruby && FLAVOR=no_x11 sudo make install and waiting a little bit as Ruby was compiled for my system.  The next step was to build the [Ruby Gems](http://www.rubygems.org/) package. Unfortunately, this package does not ship with a port in OpenBSD, but you can find one online at [this link](http://archives.neohapsis.com/archives/openbsd/2006-01/0710.html), download it and untar it in /usr/ports/devel then run cd /usr/ports/devel/ruby-gems && sudo make install to build the Ruby Gems package.

At this point you can install all sorts of Ruby packages with little difficulty, but we're going to need to stay in the ports tree for a little bit longer.  If do not yet have sqlite3 installed, do that now.  While it's possible to run Rails applications with any database, I chose SQLite because I don't feel like setting up a full blown MySQL or PostgreSQL database on my web server.  So, run the command cd /usr/ports/databases/sqlite3 && sudo make install, to build the libraries necessary for SQLite3, the preferred database for this little tutorial.  Finally, you'll need to use the Ruby Gems package to install the SQLite3 bindings for Ruby, and [Rake](http://rake.rubyforge.org/), which is Ruby's version of the venerable [Make](http://www.gnu.org/software/make/) software.  Installing software packages with Ruby Gems is pretty quick.  Just run these two commands to install both Rake and the SQLite3-ruby bindings.  If you're presented with multiple choices, just take the newest version. sudo gem install sqlite3-ruby, sudo gem install rake.  Finally, at this point you should all of the prerequisites installed for running Tracks on your system.

The next step is to download Tracks and unpack it.  I recommend creating a generic symlink to make the path something like ~/tracks instead of ~/tracks-1.041. It's much cleaner and easier to understand.  I'll also assume that you've followed the [default installation instructions](http://www.rousette.org.uk/projects/manual/index) and been able to get it running at http://0.0.0.0:3000/, as specified in the documentation.  Now, we've gotta have some fun and change a few things around.  The reason we need to move stuff around is because Rails expects to be at the root of the directory tree, and not somewhere else, we're going to shoehorn it.  Start by adding the following line to ~/tracks/config/environment.rb.

    :::ruby
        ActionController::AbstractRequest.relative_url_root = "/tracks"


This tells Rails that it's not at the root of the directory hierarchy anymore. Now, we need to correct a small problem with the static content.  There probably is a more appropriate way to do this, but I've found my method works quite nicely.  Just run these commands:

    :::sh
        cd ~/tracks/public
        mkdir tracks
        cd tracks
        for x in images javascripts stylesheets; do ln -s ../$x $x; done


These commands fix some of the static content issues.  If you restart your Tracks installation, you should now need to access it using the /tracks url (i.e. http://0.0.0.0:3000/tracks).  The final step is to let Apache know it's supposed to forward requests through to your Tracks installation.  Within OpenBSD, I have a file called /usr/local/apache2/conf/extra/httpd-ssl.conf, which was previously configured as my secure server.  Now, just add the following line to that file:

    :::apache
        Include conf/extra/tracks.conf


And now create the file /usr/local/apache2/conf/extra/tracks.conf, and put the following content in it:

    :::apache
        RewriteEngine on
        RewriteRule ^/tracks$ https://secure.wagstrom.net/tracks/ [R,L]

        ProxyPass /tracks/ http://127.0.0.1:3000/tracks/
        ProxyPassReverse /tracks/ http://127.0.0.1:3000/tracks/
        ProxyPreserveHost on


The first two lines help with some URL fixing in case someone forgets the trailing / at the end of the url.  The next lines tell it to proxy all requests for /tracks/ through to the special Rails instance of Lighttpd that's running.  After restarting your apache instance and starting your Tracks server, you should now be able to access your installation of Tracks through your secure server.

I should make it perfectly clear, I know basically nothing about Rails or Ruby, and frankly, there are some portions of the Apache proxy stuff I'm not 100% on either.  But, I can say, this works quite well for me and provides easy access to my Tracks installation on my secure server.  I'm not sure if there is an easier way to change where the file locations are, or if there is a way to avoid making the symlinks in ~/tracks/public, if there is, I'd love to hear it.  My major comment is that this whole process was much more difficult to figure out than it should have been.  You'd think that with all the blabbering from the [Web 2.0 kids](http://store.muledesign.com/shirts/koolaid.php) this process would easier than that, with better documentation.  It took me quite some time of scouring the web to figure this out, here's hoping that I get some Blogosphere loving and this post can save you time in the future.