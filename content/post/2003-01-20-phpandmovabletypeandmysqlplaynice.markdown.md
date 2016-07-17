---
date: '2003-01-20T22:00:00-05:00'
old:
  layout: post
  oldcategories:
  - old
  status: published
  timestamp: 10:00 PM Monday, January 20, 2003 EST
  wordpress_id: '98'
slug: phpandmovabletypeandmysqlplaynice
tags:
- old
- php
- mysql
title: PHP and Movable Type and MySQL Play Nice
url: /weblog/2003/01/20/phpandmovabletypeandmysqlplaynice/
---

I'm glad that I started using the MySQL stuff for movable type.  I just wrote
snippet of code that selects the five most recent entries from my blog and
produces links for them.  Here is the code (where it's assumed <span class="command">$GLOBALS["dbh"]</span>
is a handle to the [PEAR](http://pear.php.net/) database handle):

{{< highlight php >}}
function mtLink($_entryId, $_entryTitle, $_entryDate) {
    echo "&lt;li>&lt;a href=\"weblog/archives/";
    for ($i = (6 - strlen($_entryId)); $i > 0; $i --) {
        echo "0";
    }
    echo $_entryId.".html\">".$_entryTitle."&lt;/a>&lt;br />\n";
    echo date("F j, Y, g:ia",$_entryDate)."&lt;/li>\n";
}

function latestWeblogs() {
    $dbh = $GLOBALS["dbh"];
    $stmt = "  SELECT entry_id, entry_title, unix_timestamp(entry_created_on)
                 FROM mt_entry
             ORDER BY entry_created_on desc
                LIMIT 5";
    $result = $dbh->query($stmt);
    while ($thisrow = $result->fetchRow(DB_FETCHMODE_ASSOC)) {
        mtLink($thisrow["entry_id"], $thisrow["entry_title"], $thisrow["unix_timestamp(entry_created_on)"]-3600*6);
    }
}
{{< /highlight >}}



The 3600*6 is to put everything in my timezone.  It's not flaweless and may get stuff off by an hour or two, but works well enough.  This will, by default just print list items, so you'll want to encase it in a &lt;ul> or  &gt;ol> or something like that.  You can see the results on the sides of most of my pages.
