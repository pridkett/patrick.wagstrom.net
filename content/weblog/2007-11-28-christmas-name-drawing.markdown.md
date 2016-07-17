---
date: '2007-11-28T14:32:00-05:00'
old:
  layout: post
  oldcategories:
  - python
  status: published
  timestamp: 02:32 PM Wednesday, November 28, 2007 EST
  wordpress_id: '297'
oldtags:
- christmas
- drawing
- python
- random
slug: christmas-name-drawing
tags:
- python
- random
- christmas
- drawing
title: Drawing Names For Christmas with Python
url: /weblog/2007/11/28/christmas-name-drawing/
---

This year my family finally decided to stop trying to shop for everyone and instead just draw names to see who is giving presents to whom.  In the past I've been at such name drawing events and they always seem to have issues, such as two person cycles or when someone is supposed to buy a gift for someone they don't really know that well.  It's also a little hard for us to draw names because we live so far from family.

Seeking to alleviate those problems, this year I wrote a little python script that takes care of all those problems for us.  The lines for names and invalidpairs are what you'll want to customize.  names is just a list of all the people that should be drawn.  invalidpairs a list for each individual of who they should not be able to draw.
Because we assume that spouses are already exchanging gifts, they're in the lists.  Also, my wife throught it strange that our parents wouldn't get presents from us, so I made it so spouses can't give to our parents, although they still can receive.

    :::python
        #!/usr/bin/python

        from sets import Set
        import random

        names=['mom','dad','phil','petra','pete','patrick','kristina']
        invalidpairs={ 'mom': Set(['dad']),
                       'dad': Set(['mom']),
                       'phil': Set(['petra']),
                       'petra': Set(['phil','mom','dad']),
                       'patrick': Set(['kristina']),
                       'kristina': Set(['patrick','mom','dad'])}

        ok = False
        while not ok:
            try:
                # shuffle the names a bit more
                random.shuffle(names)
                pairings = {}
                availablenames = list(names)
                curinvalid = {}
                # cheat and make a copy of the names here
                for person in names:
                    curinvalid[person]=Set(invalidpairs.get(person,Set()))
                    curinvalid[person].add(person)
                # draw the names
                for person in names:
                    pairings[person] = random.choice(list(Set(availablenames).difference(curinvalid.get(person,Set()))))
                    availablenames.remove(pairings[person])
                    curinvalid[pairings[person]].add(person) # eliminate A=>B, B=>A possibilites
                ok = True
            except IndexError:
                continue

        for key,val in pairings.iteritems():
            print "%s=>%s" % (key, val)


The program itself is pretty straight forward.  Basically, keep on iterating until it finds a combination of people that works, starting with a new random individual each time.  Once person A draws     person B, make it so person B cannot draw person A.  The program doesn't do anything to ensure that you've given it a combination
of restrictions that works, however.  So it can run forever.

Anyway, it seems to have worked okay for our family, maybe it will work for your family too.