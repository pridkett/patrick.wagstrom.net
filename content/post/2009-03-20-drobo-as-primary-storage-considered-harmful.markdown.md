---
date: '2009-03-20T11:01:00-04:00'
old:
  layout: post
  oldcategories:
  - mythtv
  status: published
  timestamp: 11:01 AM Friday, March 20, 2009 EDT
  wordpress_id: '687'
oldtags:
- drobo
- io
- mythtv
- storage
slug: drobo-as-primary-storage-considered-harmful
tags:
- io
- storage
- drobo
- mythtv
title: Drobo as Primary Storage Considered Harmful?
url: /weblog/2009/03/20/drobo-as-primary-storage-considered-harmful/
---

<div class="image caption center">
    <img src="/weblog/media/2009/03/drobo-promo.jpg" alt="Advertisement from mwave.com billing Drobo as your new Primary Storage">
    <p>Advertisement from mwave.com billing Drobo as your new Primary Storage</p>
</div>

In October 2008 I purchased a 1st generation [Drobo](http://www.drobo.com/) to provide additional storage space for my growing collection of recordings from [MythTV](http://www.mythtv.org/).  The plan was to use the Drobo as primary storage for MythTV recordings, something I believed to be acceptable because recording high-definition television maxes out at a couple of megabytes a second.  The Drobo is equipped with a USB2 connection and should be able to push well more than that.  The Drobo also provided some great advantages, such as on the fly addition of disks to the array, and data redundancy.  Along with the Drobo I purchased two Western Digital 1TB green drives.  After migrating some drives from my old array I had a Drobo with 2x1TB and 2x320GB drives.  I was able to take the number of drives in the actual case for my MythTV box down to just two, and in the process, reduce heat and noise from the machine.

I'm now about five months into this little experiment, and it's been met with mixed results.  After installing the Drobo I had about 700GB of a 1.6TB drive occupied.  Writes were fast and I never had problems with recording multiple shows, watching recordings, and even transcoding recordings all at the same time.  However, the Drobo allowed me to be lazy, I no longer needed to worry about diligently transcoding recordings.  Soon I found my 1.6TB drive filling up and yellow lights appeared telling me that I had better upgrade a disk in the array. Rather than inserting a new disk, I took the opportunity to transcode hundreds of recordings from MythTV.  When combined with cutting commercials and a small decrease in resolution, I can take a 4GB HDTV episode of the Office and drop it down to around 500MB with little degradation.

At this point I started to notice issues with MythTV under heavy usage.  On Monday nights I often have both HD tuners recording, an analog tuner recording, transcode jobs running, commercials being flagged, and I'm often watching a high def program.  This actually maxes out to a little under 10MB/s, something the Drobo should be able to do with little problem.  However, recordings from that evening would frequently end up missing small bits of video and jumping ahead.  For some shows this was no problem, but it could miss a critical moment in a show like 24.  I quickly identified the problem as the Drobo not being able to keep up with the requests.  During some down time I used [Bonnie++](http://www.coker.com.au/bonnie++/) to calculate a synthetic estimate of disk throughput -- the results were downright ugly for the Drobo:

<pre>
    Version 1.03c       ------Sequential Output------ --Sequential Input- --Random-
                        -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
    Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
    spongebob        4G 10260  40 <b style="color: red;">14116</b>   8  8107   5 16746  57 <b style="color:red;">18169</b>   3  61.5   0
                        ------Sequential Create------ --------Random Create--------
                        -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
                  files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
                     16 10085  40 +++++ +++ +++++ +++ 26325  98 +++++ +++ +++++ +++
</pre>

For comparison, here is the output of Bonnie++ on a 320GB internal hard disk:

<pre>
    Version 1.03c       ------Sequential Output------ --Sequential Input- --Random-
                        -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
    Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
    spongebob        4G 42271  94 <b style="color:red;">55788</b>  31 28871  14 50686  96 <b style="color:red;">71219</b>  16 128.7   1
                        ------Sequential Create------ --------Random Create--------
                        -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
                  files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
                     16 22504  96 +++++ +++ +++++ +++ +++++ +++ +++++ +++ +++++ +++
</pre>

I've put the most relevant stats in red bold.  In the case of the Drobo, creating files at the block level, which should be the fastest results in a throughput of about 14MB/s, while the 320GB internal hard disk whizzes by at 55MB/s.  Likewise, the read rates are dramatically different, Drobo maxes out at 18MB/s, while the single internal hard drive reads at 71MB/s.  For comparison, my 4 drive software RAID 5 array used to read at 106MB/s.

Under most circumstances, switching to a disk array results in an increase in performance.  Both writes and reads are spread out across multiple disks, reducing issues with seek time and allowing parallel reads and writes.  However, that is clearly not the case with the Drobo.  Much of the bottleneck is probably a result of the USB2 interface to the Drobo, however, that cannot be the entire reason for the slow throughput.  Many other people have noted the slow performance of the Drobo (see [MaximumPC](http://www.maximumpc.com/article/data_robotics_drobo), [Mac360](http://mac360.com/index.php/mac360/comments/drobo_the_best_mac_home_backup_system_ever/), and [CNet](http://reviews.cnet.com/external-hard-drives/drobo/4864-3190_7-32470303.html?messageID=2576911) reviews).  On occasion a reviewer will get slightly confused because the device automatically slows down as it gets closer to being full -- this is ensure you have enough time to get another hard disk and replace a smaller one.  But what's really strange is how sometimes the Drobo just stops writing for a period of seconds at a time.  Here's some output from [dstat](http://dag.wieers.com/home-made/dstat/) when copying a large file from an internal hard drive to the Drobo:

<pre>
    ----total-cpu-usage---- --dsk/sdc1- -net/total- ---paging-- ---system--
    usr sys idl wai hiq siq| read  writ| recv  send|  in   out | int   csw
      1  14   0  83   0   1|   0    <b style="color:red;">21M</b>| 236B 1064B|   0     0 |1675  3260
      3  14   0  81   0   2|   0    <b style="color:red;">24M</b>| 590B  448B|   0     0 |1745  3456
      3  17   0  79   0   2|4096B   <b style="color:red;">21M</b>| 236B  448B|   0     0 |1728  3416
     12  13   0  71   0   3|   0    <b style="color:red;">26M</b>|  29k   29k|   0     0 |1784  3654
      6  33   0  59   0   3|   0    <b style="color:red;">23M</b>| 907B 1139B|   0  8192B|2020  3285
      2  10   0  86   0   2|   0    <b style="color:red;">18M</b>| 596B 3586B|   0     0 |1708  3487
      3  17   0  77   0   2|   0    <b style="color:red;">20M</b>|6262B 3530B|   0     0 |1830  3684
      4  16   0  77   0   4|   0    <b style="color:red;">24M</b>| 354B  448B|   0     0 |1952  4022
      9  12   0  77   1   2|4096B   <b style="color:red;">21M</b>|5203B 8709B|   0     0 |1843  3875
     14   9   0  76   0   3|   0    <b style="color:red;">22M</b>|4848B 5200B|   0     0 |1938  4340
      5  29   0  65   1   2|   0    <b style="color:red;">16M</b>| 224B  586B|   0     0 |1686  3143
      4  12   0  82   0   1|   0  <b style="color:red;">7684k</b>| 354B  464B|   0     0 |1370  2609
      2   5   0  92   0   1|   0  <b style="color:red;">6580k</b>| 416B  536B|   0     0 |1118  2147
      2   9   0  89   1   1|   0  <b style="color:red;">8856k</b>| 210B  510B|   0     0 |1290  2449
      1   6   0  92   0   1|   0  <b style="color:red;">7860k</b>| 462B  600B|   0     0 |1177  2131
      2   3   0  94   0   1|   0  <b style="color:red;">7156k</b>| 328B  560B|   0     0 |1094  1970
      3   4   0  94   0   1|   0  <b style="color:red;">8192k</b>| 578B  798B|   0     0 |1090  2017
      2   3   0  95   0   1|   0  <b style="color:red;">3616k</b>| 573B  743B|   0     0 | 966  1605
      2   5   0  92   0   0|   0   <b style="color:red;">920k</b>| 354B  464B|   0     0 | 939  1610
      5  12   0  82   0   1|4096B <b style="color:red;">5656k</b>|3555B 3787B|   0     0 |1239  2240
     25  21   0  53   0   1|   0  <b style="color:red;">2416k</b>|  38k   39k|   0     0 |1105  2323
      7   6   0  86   0   0|   0  <b style="color:red;">3120k</b>| 524B  894B|   0     0 |1032  1833
      7   7   0  85   0   0|   0  <b style="color:red;">6152k</b>| 925B 1673B|   0     0 |1153  2040
      4   4   0  93   0   1|   0   <b style="color:red;">960k</b>| 708B  680B|   0     0 | 947  1683
      8  15  27  50   0   0|   0  <b style="color:red;">2176k</b>|3086B 3121B|   0     0 | 973  1587
      6  30  48  16   0   1|   0  <b style="color:red;">1080k</b>|5286B 5664B|   0     0 | 936  1397
      6   5  49  39   0   1|   0   <b style="color:red;">960k</b>|8552B 8820B|   0     0 | 954  1606
      9  18  49  24   0   0|   0     <b style="color:red;">0</b> |6230B 6486B|   0     0 | 919  1454
      7  28  49  16   0   0|   0     <b style="color:red;">0</b> |  10k   11k|   0     0 | 897  1313
      4   4  49  43   0   1|   0     <b style="color:red;">0</b> | 811B 1123B|   0     0 | 945  1690
      3   3  48  46   0   0|   0     <b style="color:red;">0</b> | 236B  464B|   0     0 | 910  1553
      4   3  50  44   0   0|   0     <b style="color:red;">0</b> | 250B  584B|   0     0 | 965  1760
      2   2   0  96   1   0|   0   <b style="color:red;">584k</b>| 354B  432B|   0     0 | 927  1589
      4   4   0  92   0   1|   0   <b style="color:red;">120k</b>| 236B  432B|   0     0 | 866  1437
      5   5   0  89   0   0|   0     <b style="color:red;">0</b> | 118B  432B|   0     0 | 864  1520
      4   4   0  92   0   0|   0   <b style="color:red;">600k</b>| 236B  432B|   0     0 | 910  1631
      5   5   0  90   0   0|   0   <b style="color:red;">960k</b>| 354B  432B|   0     0 | 880  1588
      5   5   0  89   0   1|   0  <b style="color:red;">1680k</b>| 236B  448B|   0     0 | 923  1495
     13  29   0  57   1   0|   0    <b style="color:red;">11M</b>|  14k   14k|   0     0 |1341  2112
      8   5   0  87   1   0|   0 <b style="color:red;"> 6704k</b>|1693B 2067B|   0     0 |1094  1948
</pre>

I've highlighted the amount of data being written to the Drobo in red, where you can see that for extended periods of the file copy the Drobo decides it would rather not write anything.  What's interesting is that this occurred right after the Drobo went into what seemed like a "Turbo Mode", writing at rates of over 20MB/s.  Clearly, this is a problem, and such blocking of writes mean that Drobo cannot be used as a primary storage device for MythTV.  It works wonderful for playing back of recorded programs, storing music files, a drive for my photographs, but anything where streaming directly to disk is required is not a good idead for the Drobo.

However, I have an alternative solution.

MythTV has the concept of Storage Groups.  Originally they were designed to force MythTV to load balance recordings across multiple drives.  When a recording is selected it appears that MythTV scans all storage groups for the recording.  The solution I have adopted is to put the default recording group on an internal harddrive and create another storage group, called "Long Term", which features the Drobo.  Periodically I then copy the files from the internal hard drive to the Drobo, thus ensuring that I always have enough space to record more.  Since I've done this I haven't noticed any issues with disk load causing corruptions of recorded files.