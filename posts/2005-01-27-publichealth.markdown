title: Scary Public Health Stuff
timestamp: 09:54 AM Thursday, January 27, 2005 EST
status: published
slug: publichealth
tags:
- random
url: /weblog/2005/01/27/publichealth/

layout: post
oldcategories:
- random
wordpress_id: '41'

---

My Uber-Intelligent office and stat/public health loving officemate
Sarah sent me a wonderful
[set of public health slides from California](http://www.dhs.ca.gov/ps/cdic/cdcb/pds/cpe/Documents/090904Handout.pdf).
Apparently, this briefing was used for the Governator to convince him
that California needed to stop "Dumb growth" and be more intelligent
about creating communities.  It touches on a lot of issues, such as
community design, exercise, and walking to school and has some good
graphs in it.  I've taken the liberty of using some ImageMagick
Ninja-Foo to convert the set of slides on obesity to trends to a nice
animated gif, which you can see below.  The moral is that apparently
all the hard bodies live in Colorado, while every place else in
America is populated by fatasses.  Yay for Mississippi.

<img src="/weblog/media/2005/01/lookAtTheFatPeople.gif">
On a side note, if anyone knows how to get ImageMagick to generate a flash
image that would be nice.  Animated Gifs really are teh suck.  I can't wait
for [APNG](http://www.vlad1.com/~vladimir/projects/apng/) to get
into the main branch of FireFox and ImageMagick.  In the mean time, here is
the command line I used to make these.  A little quality time with the GIMP was
spent afterwards to ensure that maps were all about the same size.

    :::bash
        a2ps -a 39-45 -1 090904Handout.pdf -o - | \
          convert -resize 512x384 -size 512x384 -rotate 90 -delay 500 -dispose None - out.gif

