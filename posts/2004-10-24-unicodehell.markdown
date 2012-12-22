title: Help me out of unicode hell
timestamp: 09:52 PM Sunday, October 24, 2004 EDT
status: published
slug: unicodehell
tags:
- python
url: /weblog/2004/10/24/unicodehell/

layout: post
oldcategories:
- python
wordpress_id: '293'

---

This is a little plea for help so I can excape the unicode hell that I'm in.  I'm writing a little
program that crawls various web pages out there in the real world, but am having some issues with
it because of unicode related stuff.  Mainly I'm getting issues like this:




    
    
    Traceback (most recent call last):
      File "./loadFeeds.py", line 176, in ?
        parseFeed(cursor, x['rssfeed_id'], fp)
      File "./loadFeeds.py", line 148, in parseFeed
        if loadFeedEntries(st, feed_id, update_id, fp):
      File "./loadFeeds.py", line 90, in loadFeedEntries
        st.execute(query, (entry.summary, feed_entry_id))
      File "/usr/lib/python2.3/site-packages/pyPgSQL/PgSQL.py", line 3044, in execute
        parms = (self.__unicodeConvert(parms[0]),)
      File "/usr/lib/python2.3/site-packages/pyPgSQL/PgSQL.py", line 2746, in __unicodeConvert
        converted_obj.append(item.encode(*self.conn.client_encoding))
    UnicodeEncodeError: 'ascii' codec can't encode character u'\xe2' in position 127: ordinal not in range(128)
    





Now, as I'm going to be mucking around with most of this stuff as XML and not looking at most of the actual data,
I'd like to normalize everything to UTF-8 or something like that.  So here is where I'm having a problem.  It
appears that my [PyPgSQL](http://pypgsql.sourceforge.net/) likes to think that I'm in the 'ascii'
codec.  Which is all fine, if I could find an easy way to replace such entites with their &#xe2; (â) or
the likes.  Maybe my brain is just dead, but international character sets is not something I particularly want
to deal with.  Sigh.

