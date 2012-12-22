title: Will hubris kill MySQL?
timestamp: 09:59 AM Monday, December 14, 2009 EST
status: published
slug: will-hubris-kill-mysql
tags:
- europe
- european commission
- mysql
- oracle
- sun
- monty
- opensource
url: /weblog/2009/12/14/will-hubris-kill-mysql/

layout: post
oldcategories:
- opensource
oldtags:
- europe
- european commission
- monty
- mysql
- oracle
- sun
wordpress_id: '796'

---

<div class="image caption center">
    <img src="/weblog/media/2009/12/sun-oracle-mysql.png" alt="Round and Round They Go! Where They'll Stop, Monty Knows!">
    <p>Round and Round They Go! Where They'll Stop, Monty Knows!</p>
</div>

Over the weekend the twitterwebs lit up with the #savemysql tag in response to a [plea from Monty](http://monty-says.blogspot.com/2009/12/help-saving-mysql.html), the founder of MySQL.  The basic gist of Monty's plea are as follows:

  * MySQL is a critical piece of infrastructure
  * Thousands of businesses use MySQL in functions beyond the web
  * Oracle sells a variety of competing databases
  * Oracle doesn't have the best track record with Open Source
  * Therefore, Oracle should have to make a set of promises related to the commercial viability of MySQL.

The first four are all facts that are not in dispute.  The final point is Monty's conclusion from the facts, that, in and of itself, doesn't sound all that bad.  If you're the European Commission, of course you're going to be concerned if a major tool for thousands of small and medium enterprises goes by the wayside.  This would force those companies to spend untold amounts of time and money to procure another database -- one most likely provided by an American company.  Therefore, the merger between Sun and Oracle could result in a large amount of money flowing out of Europe and into the hands of the United States.

However, if we examine this issue a bit deeper, we see while Monty's facts are true, the conclusion is completely unfounded.  First, the license that MySQL is distributed under is a dual license.  Anyone can download, modify, and distribute modifications the the GPL version of the database.  One the code is available under the GPL it's forever available under that same license.  Sure, the copyright holder can change the license, but that doesn't nullify the GPL versions of the software.  So, in that sense, MySQL cannot die from the Oracle acquisition of Sun any more than it could die from when Sun purchased MySQL AB. The dual license portion is where many people got bit by the whole thing.  Many companies believed that when they purchased a license from MySQL AB or Sun to use MySQL for purposes not covered under the GPL that they  were still getting an Open Source project.  The fact of the matter is that they were not.  The dual version of MySQL may be supported by the same tools as the Open Source version and may sound the same on the surface, but the license doesn't guarantee the companies access to updated versions of the software.  What they were purchasing was not much different than a proprietary commercial piece of software that also has a free version.

For Monty to act like this is some travesty is entirely dishonest.  Of course he knew that this was the situation the whole time, he is the one who structured the MySQL licensing.  While there are a variety of companies that work in Open Source and made money from their expertise in the product area, performing consultations and developing custom extensions, MySQL AB went a step beyond this and also allowed firms to license the software out of the GPL.  This was because while other databases and packages were licensed under more business friendly licenses, the[ LGPL for JBoss](http://docs.jboss.org/jbossas/admindevel326/html/apa.html) and [BSD for PostgreSQL](http://www.postgresql.org/about/licence), MySQL AB licensed MySQL under the GPL to create this business opportunity.  There's nothing wrong with that, but it has always made MySQL adoption rather dicey inside of some enterprises because even the connectors for MySQL database access were GPL'd, making any program that used those connectors GPL.

One might argue that this licensing scheme is what made MySQL so valuable.  It was a critical piece of infrastructure and revenue could be derived from the dual licensing, something that while possible with PostgreSQL, is not nearly as easy.  Sun thought this too and they purchased [MySQL for about $1 billion](http://www.mysql.com/news-and-events/sun-to-acquire-mysql.html).  At this point I'm sure that Monty was now laughing all the way to the bank.  Then, oddly enough, [Monty left Sun within seven months of the purchase](http://news.cnet.com/8301-13505_3-10033614-16.html).  Publicly stated reasons were his disagreement with Sun wanting to offer commercial extensions to some of the core of MySQL.  In February of 2009, about five months after leaving Sun, [Monty announced the creation of Monty Program](http://monty-says.blogspot.com/2009/02/time-to-move-on.html), a new software firm that oddly enough, seems to do exactly what MySQL would have been doing if they didn't offer the dual license option.

However, now something was different, after the sale of MySQL AB to Sun, Monty no longer owned or had the rights to the source code.  That's what the $1 billion in compensation was for.  Rather than being like other entrepreneurs and going into a different venture, Monty started nearly the exact same business he had before, only with a no rights to the source code.  Therein lies the problem for Monty and his call for the EC to block the Oracle purchase of Sun.  Doing so would hurt his business.  It would hurt his business because of the license that he put the software under in the first place.  It would hurt other businesses because of the ruse that he managed to play on business that didn't completely understand Open Source licensing, and he took little effort to explain what they were purchasing.

Yes, a purchase of Sun by Oracle could hurt thousands of small and medium enterprises that rely on the dual licensed version of MySQL, but so will the continued downfall of Sun.  If Sun goes out of business it could put the code in legal limbo, leaving no one able to get a license for the code.  Furthermore, it's hurting the MySQL community right now.  With Sun being in limbo right now, I'm sure that they're not winning many new customers -- businesses hate uncertainty, and there isn't much greater uncertainty than wondering if your supplier is going to be independent or not in the next few months.  This whole thing smacks of selfishness and I truly hope that the EC sees through this ruse and the all the letters they get from the internet fanboys.

If that doesn't work, then [Michael Meeks has helpfully pointed](http://www.gnome.org/~michael/blog/2009-12-14.html) out that [Sun provides an LGPL connector to MySQL](http://extensions.services.openoffice.org/project/mysql_connector), but no one has actually requested the source code for it yet.  Just sayin'...
