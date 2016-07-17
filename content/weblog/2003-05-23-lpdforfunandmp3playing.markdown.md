---
date: '2003-05-23T16:30:00-04:00'
old:
  layout: post
  oldcategories:
  - old
  status: published
  timestamp: 04:30 PM Friday, May 23, 2003 EDT
  wordpress_id: '60'
oldtags:
- hacks
- linux
- mp3
- music
- ogg
- printing
slug: lpdforfunandmp3playing
tags:
- printing
- music
- mp3
- linux
- old
- ogg
- hacks
title: LPD for fun and MP3 playing
url: /weblog/2003/05/23/lpdforfunandmp3playing/
---

#### Background

Most true Unix geeks will recognize just how nice LPD is as a distributed
queueing mechanism for managing all jobs sent to the printer.  It has a
beautiful simplicity to it, and some mean power to go along with it.  It's a
difficult beast to tame, but once you understand it, everything will start
coming out exactly like you want it.

But, what most people don't realize is that LPD can be used for other things
too.  In fact, it can be viewed as a general queueing mechanism with a few
added bells and whistles for printers.  So let's examine a more interesting use
of LPD, an engine for distributed spooling of MP3s.

#### Motivation

The main thing that got me started on this quest was seeing these two pictures
([one](http://www.benzedrine.cx/c2k3/DSC00550-medium.jpg),
[two](http://www.benzedrine.cx/c2k3/DSC00567-medium.jpg)) from the [c2k3
openBSD hackathon](http://www.benzedrine.cx/c2k3/) I saw that obviously someone
else had figured out how to do it.  I sure as heck could also.

#### Initial Assessment

The first stop on my quest was examine the all-knowing seer of the Internet,
[google](http://www.google.com/).  That returned a [wonderful page in
Swedish](http://www.update.uu.se/~peterl/html/sub_hobbies/comp/hacks/mp3skrivare.html)
about how to do this very task.  Unfortunately, my swedish sucks, but
thankfully the scripts were written in bash, and the other big thing was just a
printcap file.

#### Creating a Printcap Entry

The first thing that you need to do is to create an entry in your printcap file
for your shiny new mp3 printer.  On most systems this file is **/etc/printcap**
on my [redhat](http://www.redhat.com/) 7.3 system (no sound card on the openBSD
firewall) it is **/etc/printcap.local**.  You'll want to paste the following
snipped of code in there:

    mp3:\
            :lp=/dev/null:\
            :sd=/var/spool/lpd/audio:\
            :if=/usr/local/bin/audiofilter:\
            :af=/var/log/audio-acct:\
            :lf=/var/log/audio-errs:\
            :sh


Now we'll walk through the entry line by line.  I'll ignore the \ at the end of
almost every line, that just tells lpd to keep reading because there is more to
come.  The last line doesn't need the \ obviously.

  * 1: **mp3:** - the name of your mp3 printer.  In this case, just mp3


  * 2: **:lp=/dev/null:** - we're not hooking this up to a physical device in the normal sense


  * 3: **:if=/usr/local/bin/audiofilter:** - this is the input filter.  I'll show how to create it later.


  * 4: **:af=/var/log/audio-acct:** - this is the accounting file.  You could do some fun stuff with this to monitor who uses the queue the most and what not.


  * 5: **:lf=/var/log/audio-errs:** - this is the file that errors will be logged to.  Well, some errors; not all errors will end up here.


  * 6: **:sh** - tells it to supress any header information that would normally be sent.  This is important or you may get junk before every file which causes audiofilter to fail.

#### An Audio Input Filter

The key to the whole system is that all of the processing is done by input filter.  On some platforms this may cause it say that the printing has stalled while a song is playing, but that's not a big deal.  There is no output from the input filter, and thus nothing is done after this.  You'll want to put the following piece of code on your system as **/usr/local/bin/audiofilter**:

{{< highlight bash >}}
#!/bin/bash
#
# This script was originally made by Teddy Hogeborn.
# Small alterations was made by:
#   Peter Lundqvist
#   Patrick Wagstrom
#
# This is a "printer filter" for playing audio files

for arg in "$@"; do
  case "$arg" in
    -d*) dir="${arg#-d}" ;;
    -e*) basefile="${arg#-e}" ;;
    -f*.*) ext="${arg##*.}" ;;
  esac
done

mp3player="mpg123 -q -o oss";
modplayer="mikmod --quiet --playmode 0 --noloops --norc"
oggplayer="ogg123 --device=oss --quiet"
file="${dir}/${basefile}"
type="$(file "${file}"| sed -e 's/^[^:]*: *//')"

case "$type" in
  MP3*)
    $mp3player -
    ;;
  Ogg*Vorbis*)
    $oggplayer -
    ;;
  RIFF*\ WAVE\ audio*)
    /usr/bin/play --type=wav --silent /dev/stdin
    ;;
  *Extended\ Module\ sound\ data*|*Protracker\ module\ sound\ data*)
    $modplayer $file
    ;;
  data|*audio*)
    if ogginfo "$file" 2>/dev/null | grep --quiet -e '^header_integrity=pass' >/dev/null; then
      $oggplayer -
    elif mp3info -x "$file" 2>/dev/null| grep --quiet -e '^File:' > /dev/null; then
      $mp3player -

    else
      play --type=auto --silent "$file" || play --type="$ext" --silent "$file"
    fi
    ;;
  *) echo "$type" >&2 ;;
esac
{{< /highlight >}}

Here is the basic overview of what the system does.  The beginning of the code
parses the arguments that are passed to the print filter from the printer.  It
then stores them in a couple of variables.  It then has some declarations for
where you can find your mp3, ogg, and mod player.  You should note, this system
is also extensible with little difficulty.

After this the format of the file is obtained by running the program **file**
on it.  This nifty little tool that most people overlook will examine a file
and usually can provide a pretty good guess about what sort of file it is.
It's great at identifying files with incorrect extensions where you'd otherwise
never be aware of it.

Finally, the options for the type of the file are parsed in a case statement
and then the appropriate player is called.  In all cases, the input stream is
fed over standard input.  The applications should be quiet, lpd usually assumes
that if there is any output from a filter that something has gone wrong.

You may need to modify this script some.  The main reason is that not all
version of the **file** utility return the same strings.  Some return "MPEG 2
layer 3 audio" for an MP3 file, while mine returns "MP3, 128 kBits, 44.1 kHz,
Stereo" or something similar.  Thus, you may need to modify the values for the
case statement some to get the system to your liking.

#### Accessing the Sound Card

Up to this point we haven't done anything that could be considered a big
security risk.  This point is minor, but you need to give the account for your
printer access to the sound card so it can play the music.  This is done by
giving it right to write the **/dev/audio** and **/dev/dsp**.  If you're lazy
you could just do a **chmod a+rw /dev/audio /dev/dsp**, but that allows all
sorts of people to do things with your sound card.  You're better off putting
all people with rights to the sound card in a group and then also putting the
lp account in the group too.  For instance, creating a group called **snduser**
with all the accounts that have access to the card in it, and also the lp
account.  The doing **chgrp snduser /dev/audio /dev/dsp** and **chmod g+rw
/dev/audio /dev/dsp** should take care of it for you.

While you're creating files, you'll need to create those two accounting files
that I mentioned in the **/etc/printcap** entry.  You can do this by running
the following commands:

    touch /var/log/audio-acct
    touch /var/log/audio-errs
    chown lp /var/log/audio-acct
    chown lp /var/log/audio-errs

#### Enjoying The Music

The final step is to enjoy the music.  Provided that you've done everything
right so far you should be able to execute **lpr -Pmp3 [your music file]** and
shortly afterwards it should start playing for your speakers.

One of the really nice things about this is that you can use **lpq** to see
what songs are on the queue and **lprm** to remove a song from the queue.  Here
is an example (yes, I own the albums):

    [/u2/mp3]
    [patrick@dreams] lpr -Pmp3 Wally\ Pleasant\ -\ Alternateen.mp3
    [/u2/mp3]
    [patrick@dreams] lpr -Pmp3 Wally\ Pleasant\ -\ Bigger\ Than\ Elvis\ -\ Wally\ World.mp3
    [/u2/mp3]
    [patrick@dreams] lpr -Pmp3 Wally\ Pleasant\ -\ In\ Love\ with\ a\ Geek.mp3
    [/u2/mp3]
    [patrick@dreams] lpr -Pmp3 Wally\ Pleasant\ -\ It\'s\ a\ Beautiful\ Day.mp3
    [/u2/mp3]
    [patrick@dreams] lpq -Pmp3
    Printer: mp3@dreams
     Queue: 4 printable jobs
     Server: pid 7043 active
     Unspooler: pid 7044 active
     Status: waiting for subserver to exit at 16:22:55.342
     Rank   Owner/ID                  Class Job Files                 Size Time
    active patrick@dreams+42            A    42 Wally Pleasant - A 2727348 16:22:38
    2      patrick@dreams+50            A    50 Wally Pleasant - B 2679246 16:22:42
    3      patrick@dreams+52            A    52 Wally Pleasant - I 3266864 16:22:49
    4      patrick@dreams+54            A    54 Wally Pleasant - I 3469897 16:22:55
#### It's not working!

Contrary to what you may be thinking, the first step if this is not working is
not to e-mail me about your system configuration.  I probably won't be much
help.  The first step is to go into the spooling directory, in this case
**/var/spool/lpd/audio** and see what's lying in there.  The file that you'll
want to look at is **status.pr**.  This provides the status of your printer.
If there was any output from the script, it will be saved in there.  Look
around in there and use that for a debugging point.

#### Questions/Follow-up Ideas

If you've got a question about this article and think it's something that
should be addressed more, let me know.  Also, if you've got an idea for a
followup, I'd like to hear those also.   I'm always looking for interesting new
hacks to try out and experiment with.

