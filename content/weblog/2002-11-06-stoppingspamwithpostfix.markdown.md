---
date: '2002-11-06T18:13:00-05:00'
old:
  layout: post
  oldcategories:
  - old
  status: published
  timestamp: 06:13 PM Wednesday, November 06, 2002 EST
  wordpress_id: '78'
slug: stoppingspamwithpostfix
tags:
- old
title: Stopping Spam With Postfix
url: /weblog/2002/11/06/stoppingspamwithpostfix/
---

So today my [brother](http://peter.wagstrom.net/) asked me to block a couple of
domain names that were spamming him.  I didn't know how to in postfix, luckily
for me [Postfix](http://www.postfix.org/), my mailer daemon, has some pretty
good support for anti-spam measures.  I'll detail two things that I did today:

First I put the following lines in my <span class="command">/etc/postfix/main.cf</span> file:

    header_checks = regexp:/etc/postfix/header_checks
    disable_vrfy_command = yes
    smtpd_banner = $myhostname NO UCE ESMTP

    smtpd_recipient_restrictions = permit_mynetworks,
           reject_unauth_destination,
           check_sender_access hash:/etc/postfix/sender_access

The first line allows the system to perform some automagic header checking on
the message.  The second line disables the VRFY command in the daemon so
spammers can't glean addresses from it.  The third just adds a string that says
"NO UCE" on the hello banner.  There have been laws passed around that say if
you have that they can't send spam.  Of course no one probably listens.  The
final one denies access to users when they execute the "MAIL FROM" command if
they are bad.

So here is the contents of my <span class="command">/etc/postfix/header_checks</span>:

    # Disallow sender-specified routing. This is a must if you relay mail
    #for other domains.
    /[%!@].*@/                              550 Sender-specified routing rejected

    # Postmaster is OK, that way they can talk to us about how to fix their problem.
    /^postmaster@.*$/                       OK

    # Protect your outgoing majordomo exploders
    /^(.*)-outgoing@(.*)$/!/^owner-.*/      550 Use ${1}@${2} instead

    # And banned domains
    /^From:(.*)@anfmail\.com$/              REJECT
    /^From:(.*)@bijouline\.com$/            REJECT
    /^From:(.*)@dreamwiz\.com$/             REJECT
    /^From:(.*)@hanmail\.net$/              REJECT
    /^From:(.*)@hitel\.net$/                REJECT
    /^From:(.*)@kbsgmp\.com$/               REJECT
    /^From:(.*)@korea\.com$/                REJECT
    /^From:(.*)@naver\.com$/                REJECT
    /^From:(.*)@nowmusic\.co\.kr$/          REJECT
    /^From:(.*)@resumestorm\.com$/          REJECT
    /^From:(.*)@salsakiss\.com$/            REJECT

And here is the contents of my <span class="command">/etc/postfix/sender_access</span>:

    # domains that bring spam

    anfmail.com     554 Spammer
    bijouline.com   554 Spammer
    dreamwiz.com    554 Spammer
    example.com     554 Mail from example domains not accepted.
    hanmail.net     554 Spammer
    in-addr.arpa    554 Mail from example domains not accepted.
    kbsgmp.com      554 Spammer
    korea.com       554 Spammer
    naver.com       554 Spammer
    nowmusic.co.kr  554 Spammer
    public.com      554 Mail from example domains not accepted.
    resumestorm.com 554 Spammer
    salsakiss.com   554 Spammer

    # Particular addresses that are bring lots of spam

    anonymous@      554 Mail from anonymous is always spam.

Then run "/usr/local/sbin/postmap sender_access" and restart postfix and you
should be on your way.  Your paths may vary also.  In addition the domains are
not all of the spammers.  I get lots more, they are just more habitual ones
that I have to deal with.  If you run an ISP don't can their accounts just
because of me.  I also run SpamAssasin on my local box that gleans the mail
from my server and my school account.  Hope this helps someone.

