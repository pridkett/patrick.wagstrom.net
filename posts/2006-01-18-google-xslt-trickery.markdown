title: Google Adsense XSLT Trickery
timestamp: 10:36 PM Wednesday, January 18, 2006 EST
status: published
slug: google-xslt-trickery
tags:
- web
- google
- adsense
- iframe
- xslt
- html
url: /weblog/2006/01/18/google-xslt-trickery/

layout: post
oldcategories:
- web
oldtags:
- adsense
- google
- html
- iframe
- xslt
wordpress_id: '230'

---

Recently I've been getting lots of hits for my [MythTV on Ubuntu Athlon64](/tutorials/mythTV64/mythTV64.xml) writeup.  I'm talking several hundred a day.  This generates a decent amount of traffic over my little cable modem line. Realizing that I now had a product people wanted, I was off to try and "monetize" that.  Where do I go?  But to Google Adsense!

Google Adsense is frighteningly easy to get working.  I was serving ads literally five minutes after I signed up.  This includes the time it took for my account to be validated by replying to an email.  However, it has a little bit of a drawback, the ads are inserted dynamically using a special little bit of javascript.  This posed a couple of problems for me on a site where most of my pages are generated using XSLT: 1. how to get the javascript in the XSLT.  2. How to get the javascript to execute.

I tried lots of fun stuff to get the adsense to properly show up in the on the fly XSLT translations, but was at a standstill.  If I had the server run everything through xsltproc before sending it to the client, it would work fine but that was slow and not nearly as cool as having the browser do the XSLT translation. For some reason, however, it looked like Firefox and XSLT capable browsers would begin executing parts of the code before the page was fully transformed. My first inclination was to use the onload hook in the body of the generated web page to get around this limitation.  In theory this does not get called until everything is completely rendered.  While I was able to get an onload function to be called, it was not capable of inserting the code into the div I had allocated.  The reason for this that when you use the innerHTML property of an element to set it's HTML, it doesn't execute the script.  This means I had no way to tell the script to go and activate itself.  Crap.

So I was stuck, I couldn't just put it right in the document because it would start executing before the page was created, causing it to not execute and I couldn't create it dynamically.  The solution?  Our hideous friend the iframe. Using an iframe with the width and height exactly that of google adsense block and setting it to no border, no padding, and no margin, I was able to load a little block after the page was translated and put up ads.  Best of all, because iframes are transparent, the original page's referer header is sent on all subsuquent requests.  And voila, it seems to work.  It's not optimal, but it's how I managed to get around that nasty problem.  Hope this can help you in the future.
