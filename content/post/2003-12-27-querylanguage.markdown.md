---
date: '2003-12-27T14:09:00-05:00'
old:
  layout: post
  oldcategories:
  - pridb
  status: published
  timestamp: 02:09 PM Saturday, December 27, 2003 EST
  wordpress_id: '278'
slug: querylanguage
tags:
- pridb
title: PriDB Query Language Intro
url: /weblog/2003/12/27/querylanguage/
---

This is a brief introduction to what I'm thinking for PriDB's query langauage.  It's a weird mixture of SQL and XPATH right now, so
you kinda need to know both.  The most simple request will look something like this:





    SELECT "//*" FROM documentName





Such a query is equal to the more conventional:





    SELECT * FROM tableName





Except that it will select each node in the document instead of each row in the table.  Now you can also apply your usual modifiers
to a query like you can in SQL.  For instance you can execute a query like this:





    SELECT DISTINCT "//*" FROM documentName LIMIT 3





This will return the first three distinct elements in the return set to the user.  On the down side, I don't know a nice way in XPATH
to say only return the first three.  For instance, if you only want the first element in an XPATH query you'd use something like //*[1],
but you can't change that to //*[1-5].  All the references that I've found to limiting ask you use to XSLT
to limit.  Which is fine and dandy, but not the way I want to do it right now.






Another interesting note is that where clauses don't exist in this modified version of SQL, at least not right now, I may add them later.
Right now the entire where clause must be specified in the XPATH identifier.  For instance to get all nodes unique nodes that have an
attribute called name with a value of simpleName you would run the following
query:





    SELECT DISTINCT "//*[@name='simpleName']" FROM testDocument
