---
title: "Amazon Thursday Night Football - A Bandwidth Story"
slug: amazon-tnf-rendeition-bandwidth
date: 2022-09-30T12:00:00-04:00
tags:
- video
- amazon
- tnf
- nfl
- streaming
url: /weblog/2022/09/30/amazon-tnf-rendition-bandwidth
---
A lot has been said about the fact that Amazon has exclusive rights (with the
exception of local markets) to Thursday Night Football this year. Also, there
[were some major concerns over the quality of the streams][rayburn] at the beginning of
the year, with many people saying the streams would cut out or look like they
were remarkably low quality. I haven't watched every Thursday Night Football
game this year, but I have watched a few. And, frankly, I was really surprised
at how bad they looked on my iPad Pro. Pixelization was quite noticeable - with
some areas just kinda looking smeared. Thankfully, it looked like this was just
massive compression artifacts, but it made it genuinely hard to watch the game
on the device because of the quality.

Unfortunately, because of the various forms of DRM employed by Amazon and
agreed to by most reputable manufacturers, I can't just use a Lighting to HDMI
adapter to HDMI capture card chain to capture the output and the quality of
taking a photo of the screen would make it really hard to show just how bad the
quality looks on these devices. I began to formualte a little bit of a plan to
measure this with some degree of accuracy. This was a little bit ad-hoc, so
it's not perfect, but it got me good numbers.

First, about the physical setup. I have 1000/1000 symmetric fiber home
internet provided by Frontier. My internal network is controlled by a Unifi
Dream Machine Pro. I have multiple Unifi UAP-nanoHD devices provided wireless
service throughout my house, property, and to some degree my neighborhood. I
also utilize wired connections to most devices wherever possible. Speed tests
from devices on the wired network usually give me about 940mbps symmetric. On
the wireless network, I'm usually around 500mbps symmetric. I've tried very
hard to ensure that I have great bandwidth everywhere.

For this test, I'm using two devices, an Apple TV 4k that was first purchased
in 2017 and a 2017 era iPad Pro. Both have no problem displaying 4k content.
The Apple TV 4k was on a wired connection and the iPad Pro was on a wireless
connection.

On the software side, I used [unpoller][unpoller] to gather data from my UDM
Pro once a minute and to log it to InfluxDB. This lets me know the number of
bytes on both wireless and wired interfaces for each device on a minute by
minute basis. Sometimes I didn't get updates for a single minute which usually
means that the counter just hasn't updated. Thus, it's important to look at
averages here as you can't assume that because there was a minute that showed 0
bytes of bytes transferred to a device that it has a terrible quality of
service and quality of experience during that minute.

Data were then exported from InfluxDB to CSVs for a time period that included
the end of the game and the beginning of the postgame. From here, it was simply
a matter of math to figure out the average rendition bitrate. This isn't 100%
perfect because sure, those devices were probably doing other small scale
network things in the background, but it's a good approximation. Then, because
this was a simple one-off, I just did the analysis in Excel. The results?

* For an AppleTV 4k with a wired connection, the average bandwidth needed for
  the video was **10.637mbps**.
* For a 2017 Apple iPad Pro with a wireless connection, the average bandwidth
  used for the video was **1.287mbps**.

I confirmed that my iPad could've received data at a much faster rate, it never
recorded less than a 450mbps connection to a wireless access point during the
period.

**In other words, Amazon appears to be sending out potato quality video to some
devices. Possibly under the assumption that we wouldn't notice. Spoiler alert,
we did.**

You can [download the Excel file with the data from this link][excel-data].


[rayburn]: https://www.linkedin.com/posts/danrayburn_streamingmedia-thursdaynightfootball-nflfootball-activity-6978879https://www.linkedin.com/posts/danrayburn_streamingmedia-thursdaynightfootball-nflfootball-activity-6978879198727651328-fP2g/?originalSubdomain=mp198727651328-fP2g/
[excel-data]: /weblog/media/2022/09/30/20220930-amazon-tnf-bandwidth.xlsx
[unpoller]: https://unpoller.com/
