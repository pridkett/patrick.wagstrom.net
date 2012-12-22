title: Fixing Letterboxed and Pillarboxed Transcoding in MythTV
timestamp: 11:08 AM Wednesday, September 05, 2007 EDT
status: published
slug: aspect-ratio-fix
tags:
- code
- transcode
- patches
- pillarbox
- video
- letterbox
- mythtv
url: /weblog/2007/09/05/aspect-ratio-fix/

layout: post
oldcategories:
- mythtv
oldtags:
- code
- letterbox
- mythtv
- patches
- pillarbox
- transcode
- video
wordpress_id: '165'

---

The recent demise of [Zap2it labs](http://labs.zap2it.com/) and the subsuquent creation of [Schedules Direct](http://www.schedulesdirect.org/) was a pretty remarkable change in the MythTV community.  The community now has an almost official blessing from a TV Guide service to continue, a pretty big event for most open source projects.

However, due to the infrastructure of MythTV, it's not easy to add a new TV listing service.  Rather, the change from Zap2it to Schedules Direct required all users to upgrade their copies of MythTV to the newest version of the stable branch.  Unfortunately, this version still has issues with transcoding high definition signals.  The major issue is that mythtranscode has no knowledge of the program aspect ratio.  It ends up storing pixels that aren't needed, such as what happens when a 16:9 signal is sent in a 4:3 signal (letterboxed) or when a 4:3 signal is sent in a 16:9 signal (pillarboxed, much more common). In an ideal world, MythTV would know how to cope with these automatically when transcoding and just magically cut off the offending portions.

<div class="image caption center">
    <img src="/weblog/media/2007/09/mythPillarBoxed.png" alt="Pillarboxing on an episode of _The Simpsons_ recorded from a high definition source">
    <p>Pillarboxing on an episode of _The Simpsons_ recorded from a high definition source</p>
</div>

<div class="image caption center">
    <img src="/weblog/media/2007/09/mythLetterBoxed.png" alt="Letterboxing of a Frontline episode recorded with a standard definition source">
    <p>Letterboxing of a Frontline episode recorded with a standard definition source</p>
</div>

While the result is still acceptable, it's not perfect and may force you to switch aspect ratios to watch the video. About a year ago, I wrote a patch for MythTV that transcoders to specify a target aspect ratio. This was against MythTV 0.20, and because the newer versions didn't provide that many desirable features, I never updated the patch or my installation of MythTV. Facing the impending loss of guide data just days before that start of the NFL season, and only weeks before the start of the new TV season, I updated the patch for MythTV 0.20.2. You can find the [transcoding aspect ratio patch in the MythTV Trac system](http://svn.mythtv.org/trac/ticket/2581).

The patch still is far from perfect, and you'll need some cron hackery to get it to work right. The main reason is because although MythTV allows you to create non-standard transcoder names in the frontend, it won't let you use them for anything but the default transcoder. To get around this, you'll need to look into your MythTV database and get the transcoder id numbers. For my system, I created a set of transcoders for 1080i, 720p, and 480i content that give me the option
of whether or not to resize on the transcode and the quality. Run the following command on your database to get a listing of the transcoders:

    mysql> select * from recordingprofiles;
    +----+-------------------+-------------------------+-------------------------+--------------+
    | id | name              | videocodec              | audiocodec              | profilegroup |
    +----+-------------------+-------------------------+-------------------------+--------------+
                                              :: snip ::
    | 27 | 1080i No Resize   | MPEG-4                  | MP3                     |            6 |
    | 28 | 1080i Resize      | MPEG-4                  | MP3                     |            6 |
    | 29 | 720p No Resize    | MPEG-4                  | MP3                     |            6 |
    | 30 | 480i No Resize    | MPEG-4                  | MP3                     |            6 |
    | 31 | 720p Resize       | MPEG-4                  | MP3                     |            6 |
    | 32 | 720p Resize Med   | MPEG-4                  | MP3                     |            6 |
    | 33 | 1080i Resize Med  | MPEG-4                  | MP3                     |            6 |
                                              :: snip ::
    | 46 | 1080i SDTV Resize | MPEG-4                  | MP3                     |            6 |
    | 47 | 720p SDTV Resize  | MPEG-4                  | MP3                     |            6 |
    +----+-------------------+-------------------------+-------------------------+--------------+
    47 rows in set (0.01 sec)

Transcoders 27, 28, 29, 31, 32, and 33 all leave the aspect ratio unchanged.  Transcoder 30 is a transcoder that resizes 480i letterboxed content.  Transcoders 46 and 47 remove pillarboxes from SDTV signals transmitted over HD.  You'll also notice that I have different transcoders for 1080i and 720p.  You don't need to do this, but I have chosen to do this to avoid deinterlacing 720p signals -- saving a bit of time and power.

The final step is to tell MythTV to periodically update the transcoders settings. I use a simple script called from cron about every 15 minutes:

    :::bash
        #!/bin/sh
        MYTHPASSWORD="-pYOURMYTHPASSWORD"
        echo "update recorded set transcoder=28 where chanid=3215 or chanid=3220 or chanid=3212 or chanid=3211;" | nice -n 10 mysql -u mythtv $MYTHPASSWORD mythconverg
        echo "update recorded set transcoder=31 where chanid=3213 or chanid=3210 or chanid=3214;" | nice -n 10 mysql -u mythtv $MYTHPASSWORD mythconverg
        echo "update recorded set transcoder=47 where (chanid=3213 or chanid=3210) and (title='The Simpsons' or title='Family Guy' or title='American Dad' or title='King of the Hill');" | nice -n 10 mysql -u mythtv $MYTHPASSWORD mythconverg
        echo "update recorded set transcoder=47 where (chanid=3214) and (title='Mad Max' or title='Bubble Boy' or title='Hotel Rwanda');" | nice -n 10 mysql -u mythtv $MYTHPASSWORD mythconverg
        echo "update recorded set transcoder=47 where (chanid=3210) and (title='The Ten Commandments');" | nice -n 10 mysql -u mythtv $MYTHPASSWORD mythconverg


This script forces the 1080i channels to use transcoder 28 and the 720p channels to use transcoder 31.  The last three lines are for pillarboxed programs that recorded off 720p that must be unpillarboxed. With this in the background, when transcoding I select the default transcoder and the output will be properly cropped.

As an added bonus, this patch also fixes issues with mythtranscode not understanding that 1080i signals are encoded as 1088 (due to MPEG files needing to be a multiple of 16 lines high) and encoding a nasty gray bar at the bottom of your 1080i transcoded vidoes. It also cuts off the top eight pixels of most recordings because Comcast normally sends junk on those lines that looks like static.

**Update:** I didn't mention on my original post that if you schedule a recording via MythWeb, there is an option to set the transcoder.  In this screenshot (click for full size), you can see where I specified the transcoder "720p SDT Resize" for use on "The Simpsons".

<div class="image caption center">
    <img src="/weblog/media/2007/09/mythtvTranscoderSet.png" alt="Setting the transcoder in Mythweb">
    <p>Setting the transcoder in Mythweb</p>
</div>

