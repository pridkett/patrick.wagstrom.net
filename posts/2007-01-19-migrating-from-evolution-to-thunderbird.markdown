title: Migrating from Evolution to Thunderbird
timestamp: 11:08 AM Friday, January 19, 2007 EST
status: published
slug: migrating-from-evolution-to-thunderbird
tags:
- evolution
- linux
- thunderbird
- email
- lightning
url: /weblog/2007/01/19/migrating-from-evolution-to-thunderbird/

layout: post
oldcategories:
- linux
oldtags:
- email
- evolution
- lightning
- thunderbird
wordpress_id: '198'

---

Today I finally hit my breaking point with [Evolution](http://www.gnome.org/projects/evolution/).  It's always been with it's quirks, but in general it's worked quite well for the last four years or so.  It's address book had suitable functionality, and the filtering was okay.  But in reality, it sucked, just like all other mail clients.  For some boneheaded reason it would always start each message at the bottom of the message instead of at the top.  This meant lots of scrolling, which wasn't ideal either.  Furthermore, Evolution would just randomly bounce me around in messages.  But, for all that stuff, I still liked the support it had for mail, calendar, and addressbook all in the same location.

However, at some point, we all need to let go.  We all need to say goodbye.  And sometimes these goodbyes are booting the offending person to the curb knowing that we'll never see them again.  Evolution is an aging beast.  It's big, it's bloated.  It's slow.  It crashes all the time.  And it appears that it really isn't maintained anymore.  All [Novell](http://www.novell.com/) seems interested in doing is getting it to work with Groupwise.  Seriously, who the heck uses groupwise?  That adds no value to me as an end user.  Oh well, I'll save the rant on Novell for another day.

The biggest problem with this migration problem is that all of my data is saved in custom formats within Evolution.  Suckage to the max.  In particular, there are three major sections of data that I needed to access: addressbook, calendars, and sent email.

**Importing the Addressbook**

This was actually the most straightforward of the processes.  It was a simple matter installing the [MoreColsForAddressBook](http://nic-nac-project.de/~kaosmos/morecols-en.html) extension for Thunderbird, exporting my addressbook from Evolution as a VCard, and then importing the VCard into Thunderbird.  Voila, all of my addresses, both email and physical, were stored again.  However, it didn't keep any sense of grouping, which is a little sad.  I'll have to figure a way to work around that.

**Importing Calendars**

This was a little more difficult.  By default Thunderbird doesn't have a calendar tool, instead you'll want to install the [Mozilla Lightning](http://www.mozilla.org/projects/calendar/lightning/) extension to Thunderbird.  This is the extension version of the very nice [Mozilla Sunbird](http://www.mozilla.org/projects/calendar/sunbird/) calendar.  Lightning allow you to import iCal calendars and also use the webcal protocol to collaborate over the web.  One would think that this would be as simple as exporting my calendars from Evolution and then importing them again into Lighting -- of course, things are never that simple.  Upon my import attempt I was greeted with the following error message:

![](/resources/images/blog/lightningCalendarImportError.png)

A little digging found that the problem was due to the dates in the iCal exported file.  Specifically, Evolution violated the spec by not defining the time zone in the export.  All of the event start times were defined like this:

    
    DTSTART;TZID=/softwarestudio.org/Olson_20011030_5/America/New_York:


The issue?  Lightning does not understand the softwarestudio.org namespace for dates -- and with good reason, the calendar output from Evolution is, of course, out of the spec which states that iCal files need to define the namespaces they  operate in.  If, we execute a a search and replace on the files to replace "/softwarestudio.org/Olson_20011030_5" with "/mozilla.org/20050126_1" then that fixed many of the problems I was experiencing.  The one major exception that I had was a calendar that had a few ical invitations sent via email.  There was no way that I could manage to get this calendar to not break Lightning, so I had to copy a few entries by hand.

**Importing Sent Mail**

This method takes a bit of time, but it seems like it's the easiest method to copy mail.  As Thunderbird cannot read the mail directories of Evolution, we need to find a way to move it.  To do this I utilized my IMAP account and made some folders.  I copied the entire contents of my local sent mail from Evolution into this temporary folder, then I copied all of messages from the temporary folder to my sent mail folder in Thunderbird.  After this long process, which really was probably more roundabout than it should have been, I had all of my old sent mail imported into Thunderbird.
