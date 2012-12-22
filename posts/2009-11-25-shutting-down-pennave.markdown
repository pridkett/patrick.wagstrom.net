title: Shutting Down PennAve
timestamp: 02:10 PM Wednesday, November 25, 2009 EST
status: published
slug: shutting-down-pennave
tags:
- photos
- code
- opensource
- pennave
- picasa
url: /weblog/2009/11/25/shutting-down-pennave/

layout: post
oldcategories:
- code
- opensource
oldtags:
- opensource
- pennave
- photos
- picasa
wordpress_id: '753'

---

Several years ago I created a nifty little photo gallery webapp for [F-Spot](http://f-spot.org/Main_Page) users called [PennAve](https://secure.wagstrom.net/projects/pennave).  PennAve was designed to be incredibly simple in its use: Tag a set a photos in F-Spot as "Public", copy the database to your web server, and boom, those photos would be displayed.  It was quite simple and just worked, well for the most part.

However, in the design of PennAve I made a couple of critical errors and since that point the marketplace has changed significantly.  Some of these are issues that I should have be more aware of, other ones I couldn't have anticipated.

### Issue 1: XML? What was I thinking‽

<div class="image caption center">
    <img src="/weblog/media/2009/11/xsltdisaster.png" alt="At what point did I think that code like this would be a good idea?">
    <p>At what point did I think that code like this would be a good idea?</p>
</div>

At the time I was all hyped up on the XML goofballs and believed that making the whole thing styleable using client side XSLT would be an awesome idea.  It was just really neat that I could send an XML document and Firefox could transform it.  Think of the other clients I could use to slurp that data with little effort! In retrospect, trying to do any sort of significant styling using XSLT makes me feel like I'm slowly driving an ice pick into my head.  The clean syntax of XML gives way to the disaster of XSLT, templates, variables, and overly verbose syntax.

### Issue 2: Strange dependencies and poor documentation.

PennAve required things like [CherryPy](http://www.cherrypy.org) and [SQLObject](http://sqlobject.org/) (for a while it even required a SVN version of SQLObject, scary, eh?).  Folks know how to install a PHP script, they can probably figure out how to run a Django app.  Trying to explain to everyone how to compile [mod_wsgi](http://code.google.com/p/modwsgi/) so they could run PennAve in the web server, or use [mod_proxy](http://httpd.apache.org/docs/2.0/mod/mod_proxy.html) to redirect to CherryPy's internal web server was a big pain.  I sought to make it really easy to create your galleries, but the installation bordered on insanity for some users.

### Issue 3: Slow development of F-Spot.

I don't use F-Spot that much anymore.  I have most of my collection tagged and edited (more than 800 different tags), so I just pop in when I need to import some new photos.  However, while F-Spot was pretty good four years ago, its development is slow enough that numerous other solutions make it look ancient.  The tools for editing photos are slightly substandard. It doesn't have face detection. It is sometimes prone to crashing. I'm not trying to blame Stephane Delcroix (the maintainer of F-Spot) for these problems, but that's the reality of a project that only has a small community.  Perhaps these will change with [Ubuntu's decision to make F-Spot the default instead of GIMP](http://www.omgubuntu.co.uk/2009/11/gimp-to-be-removed-lucid.html), but that's a little uncertain.

### Issue 4: Cheap online storage

Google recently announced that you could get 20GB of storage for $5/yr.  That's cheap enough that you can easily manage your entire collection online.  $20 for 80GB of storage without having to worry about bandwidth and server costs is a godsend.  Reduction in prices for Flickr also affect this.

### Issue 5: The Awesomeness of Face Detection

<div class="image caption center">
    <img src="/weblog/media/2009/11/mugshots.jpg" alt="Not even my ugly mug could break Picasa's face detection">
    <p>Not even my ugly mug could break Picasa's face detection</p>
</div>

F-Spot has a default category of people where you can create a tag for each person.  However, this merely associates the photo with a person, not an area of a photo with a person.  Using face detection you can find people in all your photos, many times automatically.  For example, I've found cases where I had photos of friends from before I became friends with them.  When I put these photos in F-Spot I didn't tag those photos, but now I'd like to do that.  Face detection takes care of that with no interaction from me.

### Issue 6: Geotagging

Once again, F-Spot has a default category of places.  I carefully created a hierarchy of locations so I could quickly find all of my photos taken in Pittsburgh, or Pennsylvania, etc.  However, it's much better if photos can say exactly where they're taken, which is where geotagging is helpful.  Photos from my iPhone already are geotagged and the integration of Picasa with Google Earth and Google Maps makes it dreadfully simple to tag all of my other photos.

Independently none of these issues was bad enough to cause me to stop development, but in sum, they're huge.  I never started PennAve to get hordes of fans, mainly I needed a way to show my own photos and if a few other people might find it useful, that would be great.  I'm pleased that a handful of other people have found PennAve useful, but times change and it's time to move on.  Therefore, I'm declaring officially that I'm stopping development on PennAve.  I'll keep the site up for the reasonable future, but I won't make efforts to update the software or ensure the website stays operational indefinitely.  Thanks for all the help from everyone!
