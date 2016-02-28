---
date: '2009-03-24T17:49:00-04:00'
old:
  layout: post
  oldcategories:
  - mythtv
  status: published
  timestamp: 05:49 PM Tuesday, March 24, 2009 EDT
  wordpress_id: '709'
oldtags:
- drobo
- mythtv
- python
slug: safely-migrating-recordings-in-mythtv
tags:
- python
- drobo
- mythtv
title: Safely Migrating Recordings in MythTV
url: /weblog/2009/03/24/safely-migrating-recordings-in-mythtv/
---

As I mentioned in my [previous article about using a Drobo as primary MythTV storage](http://patrick.wagstrom.net/weblog/2009/03/20/drobo-as-primary-storage-considered-harmful/), the optimal solution for using a Drobo in MythTV is to record to an internal hard drive and then migrate the recordings later to the Drobo.  When migrating recordings care is required because the recording could be in use, either as a result of someone watching the recording or because transcode/commercial flagging jobs are running on the recording.  Fortunately, MythTV stores almost everything in a MySQL database, which makes it really easy to find out the status of a recording.

There are two tables that you'll need to examine to ensure a recording is not currently in use.  The first table to check is the **jobqueue** table.  This table lists every recording that has pending jobs on it, whether user jobs or internal jobs such as commercial flagging.  It also leaves entries in the table for logs, so you can't just make sure there are no entries for a program in the table.  The trick here is that you'll want to make sure that the program you're examining has a status that is greater than 255, which indicates that there isn't a pending job.  All statuses over 255 indicate some sort of completion.

The second step is to make sure the program isn't currently recording or being watched.  This is accomplished by looking at the **inuseprogram** table.  If a program has an entry in here, you certainly should not try to move the recording, and instead just wait until some later time to move it.

When you combine these two checks, you can be fairly certain that recording isn't in use and moving it will be safe.  Rather than having to perform these checks by hand, I've created a script called MythMigrator which looks at a storage group and will migrate all recordings no in use to another group.  I've made a git repository available at [http://patrick.wagstrom.net/git/cgit.cgi/mythmigrate](http://patrick.wagstrom.net/git/cgit.cgi/mythmigrate) where you can download the script.

To utilize the script you'll need to have two different storage groups defined, one where your recordings are initially stored, and another where they are archived for long term storage.  In my case these are called "Default" and "Long Term".  Now it's as simple as running a cron job at some lightly loaded time, for me this is about 9am, with the following command:

    :::bash
    python MythMigrator.py "Default" "Long Term"


That's all there is to it.  My recordings are safely migrated every morning and I hope this script can help you too.