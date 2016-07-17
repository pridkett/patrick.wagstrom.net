---
date: '2005-10-11T22:25:00-04:00'
old:
  layout: post
  oldcategories:
  - priblog
  status: published
  timestamp: 10:25 PM Tuesday, October 11, 2005 EDT
  wordpress_id: '283'
oldtags:
- code
- priblog
- programming
- python
- sqlobject
slug: sqlobject
tags:
- sqlobject
- code
- priblog
- python
- programming
title: SQLObject Fun
url: /weblog/2005/10/11/sqlobject/
---

I've made some pretty good progress on Priblog lately, the biggest change
is that I discovered the magic of [SQLObject](http://sqlobject.org/).
SQLObject makes it pretty transparent to access database tables without
writing a single line of SQL.  It's not that I don't like writing SQL, it's
just that when you start writing custom SQL statements, you inevitibly end up
breaking cross platform compatability.  For example, [PostgreSQL](http://www.postgresql.org/) has sequences that are used to automatically increment
id counters while [MySQL](http://www.mysql.com/) has the auto
increment row attribute.

With SQLObject, I just define some new style classes in Python and the
SQLObject layer takes care of everything else for me.  You can even have it
create the tables for you, which means that there is no work on the
part of the user other than making sure that a user can access the database.
What does all this mean for Priblog?  It means that I just added support for
MySQL, sqlite, and a slew of other databases with zero effort.  Sweet.
