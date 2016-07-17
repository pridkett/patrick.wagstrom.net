---
date: '2003-05-27T19:12:00-04:00'
old:
  layout: post
  oldcategories:
  - old
  status: published
  timestamp: 07:12 PM Tuesday, May 27, 2003 EDT
  wordpress_id: '88'
slug: aheftydoseofslashdotting
tags:
- old
title: A hefty dose of slashdotting...
url: /weblog/2003/05/27/aheftydoseofslashdotting/
---

It was a peaceful Saturday morning.  The sun was out.  The skies were blue.  A
few birds were singing.  Overall it was one of those beautiful late May days
here in Chicagoland.  I was completely unaware that coming my way was attack
which no mere mortal could stand in the way of, the [slashdot
effect](http://www.wikipedia.org/wiki/Slashdot_effect) was heading my way.

I began by thinking that my [broadband
connection](http://www.sprintbroadbanddirect.com/) was just a little slow.  I
was browsing CNN and Slashdot some and it seemed a little slow.  I attributed
this, at first, to some over aggresive filters that I had running.  You see, I
run a healthy dose of portsentry on my computer.  This means that quite
frequently sites get blocked if they try to open connections to my computer.
In the past this has blocked CNN and OSDN's ad servers, IIT's webmail, and a
host of other sites that I find generally useful.

Anyway, stuff was slow, so I reloaded slashdot for about the fifth time that
morning, and that's when I saw the horror.  My weblog had made front page news
on slashdot.  The fury was about to begin...

#### The Beginning

The original article was posted to my web page at 4:30pm CDT on May 23rd, 2003.
Shortly afterwards I posted a comment on [this
thread](http://www.deadly.org/commentShow.php3?sid=20030522084624&pid=45) at
[deadly.org](http://www.deadly.org/) which had inspired my work in the first
place.  The time of that comment was about 10 minutes later (deadly is in
eastern time).  It's unfortunate that deadly didn't automatically linkify it
like it was supposed to because I can't track how many people came to visit it
after that.

CowboyNeal posted the article on the slashdot homepage at 9:10AM CDT on May
24th, 2003.  Previous to this point in time there was not a single person who
followed a referrer to my page.  Meaning that
[slashdot](http://www.slashdot.org/) was the first link that was pointed to my
site.  The first reference to slashdot that appears in my log was from
cache-1.atw.pa.webcache.rcn.net, it's hard to tell if this is the person who
submitted the article, or a slashdot editor.  My hunch is that  the slashdot
editor used the address 24.247.221.123.kzo.mi.chartermi.net as I'm pretty sure
they all still live in the Holland/Grand Rapids/Kalamazoo area.  These first
hits started around 8:53AM CDT.

Previous to this point I had received 39 visits to the page with no referrer
tag marked.  This means that deadly has higher traffic than I thought as there
were 39 people willing to paste the URL I posted into their location bars.
Another interesting thing is the number of people who used the near future
feature of slashdot was fairly low.  Only 14 hits registered a referrer from
slashdot before 9:10AM CDT on May 23rd.

#### The Initial Onslaught

At 9:10AM we saw the initial barrage begin.  I figure that at this point it was
the actual posting of the article on slashdot because the hits started to come
fast and furiously.  What we see below is a plot of the hits versus time for
the first few hours.  The red steps are the hits that I received for that
minute and the green line is the smoothed version of those results using
gnuplot's bezier option.  It's not a true trend line, but it's good enough for
my work here.  This graph includes only requests for the actual document, and
not the associate style sheets.

{{< figure src="/weblog/media/2003/05/hits2.png" >}}

We can see that the server peaked around 1 request per second for the page.
With associated requests for browsers that automatically request favicon.ico
and the stylesheet this would be multiplied by a factor of two to three.  It
also should be noted that ideally only one of those requests would go out and
try to fetch the hostname of the requesting host, although I can't be sure of
that because I didn't collect that information.

Another issue of concern was the total bandwidth that was being consumed.
While I don't have a 100% accurate way of measuring this, I can get a good
estimate based off the number amount of data the apache says it sent each
minute.  This shows the bandwidth consumption for the initial slashdot effect
and includes the css sheet, but it does not include the HTTP headers that were
sent and the overhead if the data was chunked.

{{< figure src="/weblog/media/2003/05/bandwidth1.png" >}}

Surprisingly enough, it seems like the actual server processes held up pretty
well.  The computer that runs these servers is nothing spectacular, that's for
sure.  It's a little K6-200 with 4 gigs of hard disk and 96 megs of ram;
network connectivity is done via 2 ISA ethernet cards.  During the slashdotting
I had no problem sshing into the computer on the second interface and looking
around.

When I logged in I saw that the total system load was around 0.7.  This was at
the peak of the slashdotting.  I also looked at the number of running httpd
servers, it was around 30 or so.  This is far less than the 150 max servers
that I had set in the configuration file.  I did notice things were a little
slow and eventually traced this back to MySQL dieing a brutal death.
Apparently it [only recently became stable on
current](http://www.deadly.org/article.php3?sid=20030523184136). This is the
first time that I had problems with MySQL under OpenBSD, so I would have never
known it was unstable.  This is also why there are no comments from the peak of
the slashdotting.  People just couldn't connect to the mysql server.

#### The After Effects

After I realized that my broadband connection wasn't going to be of any use for
the near future and observed that it was one of those very rare days in Chicago
when the weather was actually nice, I decided to leave the system be and go
outside.  I returned later that night and found that my broadband connection
was very usuable again, and almost to the point where it seemed like nothing
happened.

The following graphs provide more information on how the slashdot effect slows
down.  It seems like it has an exponential decay in the number of requests.

{{< figure src="/weblog/media/2003/05/hits3.png" >}}

<!-- {{< figure src="/images/graphs/hits1.png" >}} -->

{{< figure src="/weblog/media/2003/05/bandwidth2.png" >}}

It's pretty clear that by 6 hours after the initial posting to slashdot, my
broadband connection was easily usuable again.  By 12 hours after the initial
slashdotting the stream had slowed to a point where it would be very hard to
even tell that a slashdotting had occurred.

#### Collateral Damage

As mentioned in the article, this was all inspired by some images on [Daniel
Hartmeier's](http://www.benzedrine.cx/) site.  I also linked to those images.
After the slashdotting I requested and received the logs from his site for the
related images and found some interesting information.  First of all, there
were 6275 total requests made to his site because of this article.  Of which
5528 came from my copy of the article, and 747 came from the mirror that
slashdot posted at [lmo.warcry.com](http://lmo.warcry.com/).

These two graphs illustrate the bandwidth used only by references from the two
links on slashdot.  I didn't try to track visits and see how much total
bandwidth was consumed if someone clicked to go to the index page and then
browsed around for a long time.  These are only cases where the referrer is one
of the two sites on slashdot.  The first one is for the first four hours of the
slashdotting, the second one is for the 48 hours after the slashdotting.  Once
again, these represent the bandwidth only as his web server, thttpd, reported
it.

{{< figure src="/weblog/media/2003/05/benzedrine.bandwidth1.png" >}}

{{< figure src="/weblog/media/2003/05/benzedrine.hits1.png" >}}

This should be a concern for anyone that links to things on the web, especially
if you know that page might be slashdotted.  From reading Daniel's page, he
states that he has a 128Kbps dsl line.  This means that his upstream is capped
around 100Kbps after you factor in PPOE overhead.  Thus, at the initial onset,
when it was averaging to over 5k/s, with spikes up to 10k/s, the links alone
were consuming a substantial portion of his bandwidth.

Moving along, we see that the requests on the linked site follows almost the
exact same pattern as the request to the slashdotted site.  There is a nice
exponential decrease, however it isn't quite as obvious because of the lower
number of site visits.

{{< figure src="/weblog/media/2003/05/benzedrine.bandwidth2.png" >}}

{{< figure src="/weblog/media/2003/05/benzedrine.hits2.png" >}}

For the sample period in question, there were 11624 unique hosts that accessed
the original document and 1858 unique hosts that accessed the mirrored
document.  Of those hosts there were 3290 hosts that accessed clicked through
the links to see the pictures that provided my motivation.  This means that
there was 23.7% overall clickthrough rate on the links (28.7% from the mirror
at warcry and 23.4% from the original document).  I'd like to see web
advertisers do that!

Now we're on to the stuff that just doesn't make any sense.  Of the 3290 hosts
that clicked through to benzedrine.cx, 239 of them clicked through from both
the original document and the mirror.  One has to wonder what these people were
thinking.  There were 637 hosts that visted both the original site and the
mirror site.  Meaning that in reality the mirror site only received about 1200
hits.  By the time that the mirror was posted, the brunt had slowed down and it
really didn't matter anymore.

#### Preventative Measures

This whole document would be fairly useless unless I had actually applied some
changest to help avoid a slashdotting in the future.  Whill, you can't really
avoid it, unless you never post anything useful.  So a better title might be
dealing with slashdottings.  I've listed a few pretty simple steps here that
can help out in that respect.

The first is to turn off hostname lookups in your http log files.  I had mine
enabled because I happen to like looking at the log files and easily seeing
where people came from, however, it means that most connections require an
addition connection to the name server.  Even though the nameserver was running
locally, for an uncached address, this meant significant overhead.  If you're
running [apache](http://httpd.apache.org/) look in your configuration file and
make sure the following line exists:

    #
    # HostnameLookups: Log the names of clients or just their IP addresses
    # e.g., www.apache.org (on) or 204.62.129.132 (off).
    # The default is off because it'd be overall better for the net if people
    # had to knowingly turn this feature on, since enabling it means that
    # each client request will result in AT LEAST one lookup request to the
    # nameserver.
    #
    HostnameLookups Off

Another interesting point is that I was bandwidth limited in this slashdotting.
As noted before, my server load never crept above 0.7 (and once I fixed MySQL,
it stayed around 0.4).  The solution is to install mod_gzip (there would be a
link to the webpage here, but the webpage appears to have gone missing).
Almost every modern web browser supports using gzip compression to on the fly
compress web pages.  Being as the slashdot effect linked to my weblog, which is
nothing but html and css, it's not a problem to compress it.  Mod_gzip takes
advantage of this.  You can find it in ports/www/mod_gzip.

Finally, I'm working on some additional tools.  I'm writing my own
mod_slashdotting module.  I'm not sure if I'll ever release it or not, but I
bought the apache module book a few years ago and have yet to create anything
productive from it.  The basic premise is this.  If the server detects more
then _n_ hits in _m_ minutes, it will use will either shut down or use some
dynamic pf rules to forward all traffic to a more powerful server.    Not quite
sure how all the mechanics of it are going to work yet.

Also, I'm doing some work stuff with altq in OpenBSD 3.3.  This lets me limit
my upstream bandwidth used by HTTP servers to an arbitrary amount.  Thus, if I
get slashdotted again, while slashdot can complain about not being able to
reach my web page, at least I'll still be able to access the rest of the
network because I'll have a slice of bandwidth available for me.

#### Comments On My Site

After seeing some of the comments on my site, it's clear why slashdot has a
moderation system.  There were a lot of comments along that seemed to be made
by 12 year olds (or people about the same level) that just were happy that they
could make my website curse.  That's pretty clever considering there already
are curses on my website in various rants.  Anyway, it shows that for a decent
traffic site, human moderation is helpful.

This is very clear in reading the quality of the comments.  Although things
more easily swayed off topic on slashdot, the comments seemed longer and more
robust.  Most comments on my website were short and to the point.  Perhaps this
has something to do with karma-whoring nature of many slashdotters.

#### Conclusion

The first thing that can be seen is that if your site gets slashdotted, don't
worry, it's only temporary.  Take the rest of the day off and go outside and do
something else.  It will be better in a few hours anyway.  This is largely
because slashdot traffic roughly follows an exponential decay model.

Another observation is that a well written article can get click through rates
that web advertisers only dream of.  A devious author could hide some links to
pay-for-click sites in their HTML and make a tidy profit.  I also wonder what
the actual click through rate would have been for a site like Amazon where you
can get a kickback if people buy the books that you reference.

One of the most interesting observations is how little a mirror site really
helps in the case of a slashdotting. Either very few people choose to visit it,
or by the time that it gets posted most people have already seen it.  An
interesting note is that the clickthrough on the mirror site was higher than
the original.  Perhaps future studies of the slashdot effect could help
determine if this is a consistent thing, or just for this one article.

There were two rather disturbing results from this study.  One is the power of
slashdot to cause collateral damage.  The documents I provided were very small
static documents, while the documents that I linked to on benzedrine.cx were
quite larger. This caused a significant amount of collateral damage to his
site, based on my site being slashdotted.  Secondly, the large amount of people
who not only visited both the mirror and the original site, but the people who
clicked through from both, seems quite high.  I have to wonder why these people
do such actions.  Do they think that the article will be different at the
different hosts?

Overall, I can say that the slashdot effect is no big deal.  It saturated my
broadband line for a short period, and I was a little worried that if it kept
up Sprint might cancel my connection, but it slowed down quite quickly and in
retrospect the bandwidth consumed is less than that of your average p2p user.

#### Acknowledgements

A substantial amount of this analysis would not have been possible without
Daniel Hartmeier of benzedrine.cx and Lewt from lmo.warcry.com providing their
httpd logs to me.  Thank you very much for your help.

