title: 'Loki Games Under Ubuntu : Alpha Centauri'
timestamp: 05:25 PM Monday, March 07, 2005 EST
status: published
slug: alphacentauri
tags:
- ubuntu
url: /weblog/2005/03/07/alphacentauri/

layout: post
oldcategories:
- ubuntu
wordpress_id: '213'

---

It's spring break so I decided I would play a few video games.  I've got
a bunch of the old Linux ports of games from
[LokiGames](http://www.lokigames.com/) (which went bankrupt in
a mess of supposed lies and missed payments in January, 2002).  Unfortunately,
these games need some work to function in Linux.  Well, at least the ones that
I've tried.

For Alpha Centauri, you should first go and fetch the patch for SMAC.  The
updates can be found at
[sunsite.dk](ftp://sunsite.dk/mirrors/lokigames/updates/).  Go
and download that.  Also, go and download the updated version of loki_patch
from [icculus](http://icculus.org/~msphil/loki/x86/).  Now, install
the game as you would normally.  The install worked just fine under my
version of Ubuntu (Warty, aka 4.10).

The tricky part comes with patching Alpha Centauri.  Running the patch generates
the following output:


    Verifying archive integrity...OK
    Uncompressing Sid Meier's Alpha Centauri 6.0a Update...................
    ./update.sh: line 60: 11336 Segmentation fault      loki_patch --verify patch.dat
    The program returned an error code (1)


This clearly isn't right.  So instead of running the patch normally, we've got
to do a bit of work.  Instead, run the patch with
`sh ./smac-6.0a-x86.run --keep`, this will preserve
the unarchived files in a directory called
`smac-6.0a-x86`.  Copy the new version of `loki_patch`
to `smac-6.0a-x86/bin/Linux/x86/loki_patch`.  Then go into the directory and
run `update.sh`.

So now we've got a nice updated version of Alpha Centauri, but it still wasn't
spitting out sound on my version of Ubuntu (I've mangled some stuff with
regards to [ALSA](http://http://www.alsa-project.org/) and ESD.
Also, I've read that there are some other issues with kernel versions.  To fix
this I created a little script and use this to run SMAC.

    :::bash
    #!/bin/sh
    LD_ASSUME_KERNEL=2.4.6 SDL_AUDIODRIVER=esd /usr/local/games/smac/smacpack $*


It may be possible to do other fun stuff using the
[other SDL environment variables](ftp://ptah.lnf.kth.se/pub/misc/sdl-env-vars).
As a side note, I could not get the dynamic version to function
properly, which is bummer because it means that I can't really update
the libraries and try other fun stuff with them.

As I play with other old games I'll post updates on how to get them going
in the weblog.
