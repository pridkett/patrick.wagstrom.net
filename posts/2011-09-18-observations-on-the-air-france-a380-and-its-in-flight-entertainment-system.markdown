title: Observations on the Air France A380 and Its In Flight Entertainment System
timestamp: 12:32 PM Sunday, September 18, 2011 EDT
status: published
slug: observations-on-the-air-france-a380-and-its-in-flight-entertainment-system
tags:
- airbus
- random
- thales
- flying
- a380
- '380'
- ife
- linux
- in flight entertainment
- hacking
- security
url: /weblog/2011/09/18/observations-on-the-air-france-a380-and-its-in-flight-entertainment-system/

layout: post
oldcategories:
- random
oldtags:
- '380'
- a380
- airbus
- flying
- hacking
- ife
- in flight entertainment
- linux
- security
- thales
wordpress_id: '976'

---

In addition to being a computer science nerd and a part-time policy wonk, I'm also a bit of a commercial aviation nut and, like [Louis CK, I think flying is pretty amazing](http://www.youtube.com/watch?v=8r1CZTLk-Gk). This year I'm on track to take about 75 flights, mainly in the United States, but a few flights to Europe and Asia. For the last two years every one of my flights has been on a [SkyTeam](http://www.skyteam.com/) carrier. This isn't so much because I think they have the best routes or best frequent flier program, in fact, I'm pretty sure that [Delta](http://www.delta.com/)'s miles are nearly worthless unless used on partner carriers, but more because of the fact that I often fly into one of Delta's [fortress hubs](http://en.wikipedia.org/wiki/Airline_hub#Fortress_hub) and upgrades make travel nicer.

I spent the last two weeks in Europe where I attended the combination meeting of the [European Software Engineering Conference and the Foundations of Software Engineering](http://2011.esec-fse.org/) conference in Szeged, Hungary. My original intention was to take Delta directly into Budapest as they offered double miles from JFK, unfortunately, Delta terminated this flight at the end of August, leaving me with the choice between transferring with [KLM](http://www.klm.com/) in Amsterdam or [Air France](http://www.airfrance.com/) in Paris (technically, [Alitalia](http://www.alitalia.com/) also serves this route, but I've never seen their flights in searches for anything but flights to Italy). Price wise the flights through either Paris or Amsterdam were about the same. Normally this would make it an easy decision to transfer in Amsterdam as Paris is horribly laid out, takes forever to transfer in, most of the lounges are outside security, and the thick French accent on the announcements makes them more difficult to understand than even announcements in Chinese airports. Yet I chose to transfer there for four reasons:
	
  1. I had never flown Air France before, so this could be a new experience.
  2. The French are far too sensible to force Backscatter X-Ray or Millimeter Wave machines (aka Porno Scanners) on their passengers.
  3. Unlike the rest of Europe, the Paris airport has drinking fountains. Not as many as a US airport, but enough so you can get some water.
  4. Air France flies the Airbus A380 on the CDG-JFK route once a day.

Applying a little flexibility to my travel schedule I was able to get a ticket on the A380. The nerd in me was excited. I've seen the A380 at numerous airports around the world, this would be my chance to ride in one. However, because it was Air France and work only pays for coach I had no hope of an upgrade and wouldn't get the premium experience. Furthermore, when I booked the ticket the agent could not get me a seat on the upper deck. Le sigh.

First impression on taking my seat: this thing is ENORMOUS. The planes center or curvature was at the same level as my head, making the walls of the plane bow out from the window seats. The inside was absolutely cavernous. The 747 Transcon is actually a little bit longer than the A380, but the wingspan of the A380 is more than 10m wider ([79.8m vs 68.5m](http://en.wikipedia.org/wiki/File:Giant_planes_comparison.svg)). In Addition to the wings being longer, they're also wider. Together with a better shape and newer material this made the A380 the quietest plane I think I've ever been on.

<div class="image caption center">
    <img src="/weblog/media/2011/09/A380WingViewAtCDG.jpg" alt="HDR View of an A380 Wing at CDG">
    <p>HDR View of an A380 Wing at CDG</p>
</div>

The A380 also has one of the nicest in flight entertainment systems that I've used. I didn't bother to count, but there seemed to be about 80 different movies and a similar number of television shows. It also did some really interesting things like show a view of the tail camera when taking off and landing, which I thought was one of the coolest things ever:

<div class="image caption center">
    <img src="/weblog/media/2011/09/A380IFEJFKLanding.jpg" alt="Landing at JFK on the Airbus A380">
    <p>Landing at JFK on the Airbus A380</p>
</div>

Once we hit about 10,000 feet the system was turned on. It is a combination of a touch screen and removable controller. From the looks of it most people were just using the touch screen. The controller was used for playing games and supposedly allowed you to make calls to the ground. I relaxed and started to watch some movies.

About halfway through my second movie the system for the girl sitting next to me stopped working. She had support for menus but couldn't play anything anymore. I started to notice that other people were experiencing a similar phenomenon: either the were stuck on menus, or worse, had crashed out to a white screen. At the end of my second movie I was able to start a third, but my curiosity had taken hold, so I started to play around, and shortly thereafter my screen crashed too.

<div class="image caption center">
    <img src="/weblog/media/2011/09/CrashedA380IFE.jpg" alt="Crashed A380 In-Flight Entertainment System">
    <p>Crashed A380 In-Flight Entertainment System</p>
</div>

The astute reader will notice that this appears to be nothing more than a bunch of PHP error messages. It's clear that there is a client server architecture and that the menus are nothing more than a bunch of HTML rendered in a web browser. It's also painfully clear what the problem is -- the server for this block of seats had reverted to a read-only file system, and unfortunately one of the scripts was having problems with this. There's a variety of other pieces of information we can get from this too. For example my IFE's IP address was 172.17.64.59, the system was developed by a division of [Thales Group](http://www.thalesgroup.com/) -- a large aerospace firm, this is the Air France customized version 2.50 of the passenger GUI, and that the utils.php file has at least 294 lines in it.

This called for more exploration, so I touched the screen on one of the spots where function.fopen was highlighted, and much to my surprise it worked. I was in a normal web browser. I pulled out the remote and hit the backspace key used for text messaging and it put me on the previous page. Things were getting interesting.

<div class="image caption center">
    <img src="/weblog/media/2011/09/CrashedA380IFE404Error.jpg" alt="One Should Never See This Screen">
    <p>One Should Never See This Screen</p>
</div>

This provided a few more pieces of information about their infrastructure. The main server was running a very outdated version of Apache on a Fedora server that thought it was host d4p1-v133. It also shows that testing standards in this part of Thales were quite poor if I was easily able to get here. The next step was to see if I could get further using the keypad. I took out the handset and began to mash buttons in an attempt to get something that might let me bring up a URL bar. The backspace button worked and moved me back to the previous page. Sadly, the handset had a shift key, but lacked ctrl, alt, and all the function keys that would let me jump there. There was, however a USB port. Most people were using the USB port to charge iPhones. I decided to stick a USB stick in. A screen popped up saying that USB was initialized, but that's all it could do. It would be nice if it provided an option to play my media on the stick. Later in the flight I learned that this was because you could purchase some content and download it to your stick.

I also conducted a physical examination of the device. The display itself is about one inch thick with an additional inch of a plastic shielding behind it. This shielding allows for air circulation and also makes it really hard to get at any ports the machine has. Luckily, I have very long and slender fingers and found that there is a single wire entering the machine from the seat that must contain power and network - no luck for surreptitiously jacking into their network. At this point I'm pretty sure that I was starting to spook out the young French girl on her way to an English school in California sitting next to me, so I ceased with the physical examination. The flight attendants also had enough complaints about the broken system that they made an announcement that they were trying to fix the situation. It was only the IFE units in our section (about 50 seats) that died. Given that there are about 500 seats on the Air France A380, there must be around 10 servers powering IFE.

The flight attendants tried a couple of times to reboot our IFE units from a master control panel somewhere on the plane. Each time the screens would go black with a single blinking cursor in the upper right corner. Then depending on the state of the client when the server went read only you'd either get un-navigable menus or the error screens like I had. I was actually quite surprised that I didn't see a penguin on bootup, but I'm pretty sure these units were Thales TopSeries units, which means they're Linux based. I wanted to explain that it was a problem with the server, but if was probably not worth my time and frankly, after having that stupid [SSSS on my boarding passes](http://en.wikipedia.org/wiki/Secondary_Security_Screening_Selection) for four years in the middle of the last decade, I should try to play nice in the sky.

Overall I can draw a couple of conclusions from this:
	
  1. I'm not certain why any writing should be done to support a client that is, for the most part, only reading media. This smells of bad design, architecture, or implementation. Probably a combination of all three.
  2. The error screens should have never been shown to users. Even when a system is horribly broken there are ways to make it show an error screen that would say something like "The IFE System is Curently Unavailable".
  3.  Next time I fly an A380 I'm bringing along some other USB gadgets such as a USB keyboard, USB mouse, and USB ethernet dongle. Given the errors that I observed I'm 90% certain that plugging in a keyboard and hitting Alt-F1 (or Ctrl-Alt-F1) would drop you to a console. From there it would be relatively easy to poke around more and see if the media are using some sort of DRM, which I doubt they are.

Sadly, I'm not going to fly on the A380 again anytime soon. I don't have any upcoming trips to Europe or Asia, but if one of my readers cares to poke around and report back I'd be thankful.

**UPDATE 9/19/2011 09:14 EDT**: The excellent folks behind the [@nycaviation](http://twitter.com/nycaviation) twitter account helpfully pointed out that [@runwaygirl](http://twitter.com/runwaygirl) [detailed the AF A380 IFE system and confirmed it is Thales TopSeries](http://www.flightglobal.com/articles/2009/11/05/334471/thales-details-ife-offering-on-air-frances-new-a380.html).
