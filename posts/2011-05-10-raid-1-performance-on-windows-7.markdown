title: Raid 1 Performance on Windows 7
timestamp: 08:44 PM Tuesday, May 10, 2011 EDT
status: published
slug: raid-1-performance-on-windows-7
tags:
- computer
- raid
- htpc
- windows
- windows 7
- media center
- benchmark
- drobo
url: /weblog/2011/05/10/raid-1-performance-on-windows-7/

layout: post
oldcategories:
- computer
- htpc
oldtags:
- benchmark
- drobo
- media center
- raid
- windows
- windows 7
wordpress_id: '963'

---

About a year ago I ditched Ubuntu and MythTV on my media center box for Windows 7 Ultimate. To be honest one of the main reasons I did this was for NetFlix, but also because I got tired of having to tweak my media center all the time and Windows 7 Media Center just works. Also Windows 7 is smart enough to know how to sleep and wake up from sleep, saving my lots of money over the course of a year.

In order to ensure that I never lose any episodes of high quality television programs, I keep my boot and recorded television programs on a Raid 1 (mirror) set of 2 TB drives. Because all of the data is copied across two different drives in theory it have higher speed reads than a single drive, but lets take a look. I admit this isn't the most intelligent of tests, as it's simply done using ATTO Disk Benchmark. First, the results for an individual 2TB Samsung drive:

<div class="image caption center">
    <img src="/weblog/media/2011/05/Independent_Overlapped_0.5_to_8192_1GB.png" alt="Performance for a single 2TB drive">
    <p>Performance for a single 2TB drive</p>
</div>

Next, the performance for a pair of 2TB Samsung drives working in a RAID-1 mirror set:

<div class="image caption center">
    <img src="/weblog/media/2011/05/Mirrored_Overlapped_0.5_to_8192_1GB.png" alt="Performance for a mirrored pair of 2TB drives">
    <p>Performance for a mirrored pair of 2TB drives</p>
</div>
  
As we see, there is very little difference between the two. In almost all cases the two setups are within about 10% of each other. There clearly is no intelligence in Windows 7 for spreading reads across multiple drives. One of the major side effects of setting up a RAID 1 is that when something goes wrong you'll need to rebuild your mirror. Unfortunately, this seems to happen much more often would be desirable and it often renders the machine nearly unusable. However, contrary to my suspicions, this has nothing to do with massively decreased disk performance:

<div class="image caption center">
    <img src="/weblog/media/2011/05/Resynching_Overlapped_0.5_to_8192_1GB.png" alt="Performance of mirrored 2TB drives while resynching">
    <p>Performance of mirrored 2TB drives while resynching</p>
</div>

I have no idea what the spike in the middle is for. It's clear, however, that the reason for the system bogging down is not because of decreased drive performance but rather because of other issues. This might be CPU related as my media center box is running on a very old AMD Athlon64x2 4400+ on a motherboard that is almost six years old. So, the resynching problems might be because of CPU issues, or it could be because of something else (perhaps CrashPlan is doing something weird). I really have no idea right now.

While I was benchmarking I also decided to benchmark my 1st generation USB drobo with 2x1TB and 2x2TB drives in it. You can see where this going. Performance is atrocious. Glad I use it for backup storage and videos.

<div class="image caption center">
    <img src="/weblog/media/2011/05/Drobo_Overlapped_0.5_to_8192_1GB.png" alt="Drobo benchmark performance. You didn't think it would be any good, did you?">
    <p>Drobo benchmark performance. You didn't think it would be any good, did you?</p>
</div>

