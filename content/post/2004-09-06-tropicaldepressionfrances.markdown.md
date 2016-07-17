---
date: '2004-09-06T22:35:00-04:00'
old:
  layout: post
  oldcategories:
  - random
  status: published
  timestamp: 10:35 PM Monday, September 06, 2004 EDT
  wordpress_id: '25'
slug: tropicaldepressionfrances
tags:
- random
title: It's Comin' Right For Us!
url: /weblog/2004/09/06/tropicaldepressionfrances/
---

One of the more interesting things about living in Pittsburgh is that we're
a lot closer to the coast and mountains (or hills, or bumps, whatever you call
the Appalachians) and as such we get weather from the coasts.  Last year I had
to try an fly out while the remnants of Hurrican Isabel were bearing down on
Pittsburgh.  This year, we get the remnants of Hurricane Frances.  It appears
that it's coming right for us.  [Weather.com](http://www.weather.com/)
says that we have a 100% chance of rain coming up here.  What fun.






[![Tropical Storm Frances Projected Path (30KiB)](/resources/images/blog/tropicalStormFrancesThumb.png)

Projected Path of Tropical Storm Frances](/resources/images/blog/tropicalStormFrances.png)






I also found out something interesting.  I was wondering why my thumbnails from
[yesterday's stitching entry](/weblog/photo/saturnStitch.xml) were
so large.  Apparently I forgot to tell [ImageMagick](http://imagemagick.sourceforge.net/) to strip out the profile information.  I should have
used the following command line: convert -size 200x200 infile.jpg -resize 200x200 +profile APP1 outfile.jpg.  This removes the extra
[EXIF](http://www.exif.org/) information embedded in the file, which isn't needed for web thumbnails.
