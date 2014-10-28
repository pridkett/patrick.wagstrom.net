title: Tracks Behind Apache With Non-Proxied Static Content
timestamp: 03:30 PM Sunday, July 30, 2006 EDT
status: published
slug: tracks-behind-apache-static
tags:
- web
- tracks
- rubyonrails
- apache
- howto
- rails
- proxy
url: /weblog/2006/07/30/tracks-behind-apache-static/

layout: post
oldcategories:
- web
oldtags:
- apache
- howto
- proxy
- rails
- rubyonrails
- tracks
- web
wordpress_id: '228'

---

In my [previous post on setting up Tracks and Ruby on Rails to run behind an Apache proxy](/weblog/web/tracks-behind-apache.xml), there was a bit of symlink hokerey  hat one had to do to make it serve the static content properly.  What if we didn't have to do that?  What if we could get by with only adding the line:

    :::ruby
        ActionController::AbstractRequest.relative_url_root = "/tracks"


To your ~/tracks/config/environment.rb file?  Wouldn't that just be grand?  What if we could go beyond that and make Apache serve up all the static content?  It's one less component to break while proxying requests back and forth.  Well, we can.

In additon to the ability of ProxyPass statements to direct requests to a remote proxy, they can also be used to deny certain URLs from a proxy.  That's the technique that we'll be using here.  Previously, the configuration section of interest
looked like this:

    :::apache
        RewriteEngine on
        RewriteRule ^/tracks$ https://secure.wagstrom.net/tracks/ [R,L]
        ProxyPass /tracks/ http://127.0.0.1:3000/tracks/
        ProxyPassReverse /tracks/ http://127.0.0.1:3000/tracks/
        ProxyPreserveHost on


Now, we just add in some lines to Apache to let it know what URLs not to proxy and how to handle those urls.  Just change the section so it now appears as follows:

    :::apache
        RewriteEngine on
        RewriteRule ^/tracks$ https://secure.wagstrom.net/tracks/ [R,L]
        
        RequestHeader set X_FORWARDED_PROTO 'https'
        
        ProxyPass /tracks/images !
        ProxyPass /tracks/stylesheets !
        ProxyPass /tracks/javascripts !
        ProxyPass /tracks/favicon.ico !
        Alias /tracks "/home/patrick/tracks/public/"
        <Directory /home/patrick/tracks/public/>
        	Options FollowSymLinks
        	Allow from all
        	Order allow,deny
        </Directory>
        
        ProxyPass /tracks/ http://127.0.0.1:3000/tracks/
        ProxyPassReverse /tracks/ http://127.0.0.1:3000/tracks/
        ProxyPreserveHost on


The first four ProxyPass statements tell Apache not to proxy requests to /tracks/images, /tracks/stylesheets, /tracks/javascripts, and /tracks/favicon.ico.  The next six lines make it so Apache actually knows how to serve the static content.  You'll obviously want to replace /home/patrick/tracks/public with wherever your location of the Tracks public data is.  Now, restart Apache and you should have Apache serving the static content and Rails serving the dynamic content.  Awesome.
