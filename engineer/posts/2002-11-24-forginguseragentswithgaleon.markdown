title: Forging user agents with Galeon
timestamp: 05:04 AM Sunday, November 24, 2002 EST
status: published
slug: forginguseragentswithgaleon
tags:
- old
url: /weblog/2002/11/24/forginguseragentswithgaleon/

layout: post
oldcategories:
- old
wordpress_id: '52'

---

So, after the fiasco with [ecollege.com](http://www.ecollege.com/) I decided to look up how to change my browsers user-agent (I use [galeon](http://galeon.sf.net/)).  Here is how you do it (take from the Galeon Faq):





  1. To get the current user agent type:

    
    gconftool -g /apps/galeon/Advanced/Network/user_agent





  2. To set a user agent type:

    
    gconftool -s /apps/galeon/Advanced/Network/user_agent --type=string "XXX"


For example, to make the system think that you're running IE 6.0 on WinXP do this:

    
    gconftool -s /apps/galeon/Advanced/Network/user_agent --type=string "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.0.3705)"





  3. Finally, to restore the default type:

    
    gconftool -s /apps/galeon/Advanced/Network/user_agent --type=string default






