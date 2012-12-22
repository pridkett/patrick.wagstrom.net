title: slashdot effect data analysis techniques
timestamp: 11:02 AM Tuesday, May 27, 2003 EDT
status: published
slug: slashdoteffectdataanalysistechniques
tags:
- old
url: /weblog/2003/05/27/slashdoteffectdataanalysistechniques/

layout: post
oldcategories:
- old
wordpress_id: '81'

---

#### Addendum: How the Data Was Analyzed





This section of information is really part of the article.  It's more just a reference for those of you who might want more information on how the data was analyzed.  This section shows the tricks that I used so if you get slashdotted you can figure out what happened too.






The first piece of required information was to get just the views of the article in question.  This was done via a series of grep commands that first found the references to the page in question, then eliminated references to css and icons.  The next two greps eliminated any access that I might have made.  I performed all the analysis on a remote computer that had access to the log via **/mnt/scissors/www/logs/patrick.wagstrom.net-access_log**.  The following command was used to get all the references:




    
    
    cat /mnt/scissors/www/logs/patrick.wagstrom.net-access_log | \
    grep /weblog/archives/000128.html | grep -v css | grep -v ico | \
    grep -v host106 | grep -v 192.168.1.2 > access_log
    





This created a file called **access_log** in my current directory.  The next step was to do some analysis of the file.  This was accomplished via the following PERL script, called **webplot.pl**:




    
    
    #!/usr/bin/perl -w
    $lastday = -1;
    $lasthour = -1;
    $currcount = 0;
    while(<>){
       if(/\.html/){
            @results = split;
            $day = int(substr($results[3],1,2));
            $hour = int(substr($results[3],13,2));
                    if ($day ne $lastday || $hour ne $lasthour) {
                            if ($lastday != -1) {
                                    printf ("2003/05/%d %02d:00 %d\n", $lastday, $lasthour, $currcount);
                            }
                            $lastday = $day;
                            $lasthour = $hour;
                            $currcount = 0;
                    }
                    $currcount ++;
        }
    }
    printf ("2003/05/%d %02d:00 %d\n", $lastday, $lasthour, $currcount);
    





This initial version provided a listing by hour of all of the hits that the site had taken.  However, I also wanted to get the hits by minute for some finer grain resolution.  This required the creation of another script, **webplot2.pl** that read in the data and did a minute by minute analysis.




    
    
    #!/usr/bin/perl -w
    $lastday = -1;
    $lasthour = -1;
    $lastminute = -1;
    $currcount = 0;
    while(<>){
       if(/\.html/){
            @results = split;
            $day = int(substr($results[3],1,2));
            $hour = int(substr($results[3],13,2));
            $minute = int(substr($results[3],16,2));
                    if ($day ne $lastday || $hour ne $lasthour || $minute ne $lastminute) {
                            if ($lastday != -1) {
                                    printf ("2003/05/%d %02d:%02d %d\n", $lastday, $lasthour, $lastminute, $currcount);
                            }
                            $lastday = $day;
                            $lasthour = $hour;
                            $lastminute = $minute;
                            $currcount = 0;
                    }
                    $currcount ++;
        }
    }
    printf ("2003/05/%d %02d:%02d %d\n", $lastday, $lasthour, $lastminute, $currcount);
    





To process all of this data, I needed a way to visualize it.  Luckily, [gnuplot](http://www.gnuplot.info/) can plot just about everything you can throw at it.  I used the following script to generate the graphs.  It assumes that output from **webplot.pl** was in **out.log** and the output from **webplot2.pl** was in **out2.log**.




    
    
    set output 'hits1.png'
    set terminal png small
    set ylabel "hits"
    set title "hits per hour"
    set grid
    set timefmt "%Y/%m/%d %H:%M"
    set xtics rotate
    set xdata time
    set xrange ["2003/05/24 00:00":"2003/05/27 00:00"]
    set xtics "2003/05/24 00:00", 14400, "2003/05/27 00:00"
    set format x "%b %d %H:%M"
    set size 1.5,0.75
    set key below title
    plot 'out.log' using 1:3 title "Hits" with steps
    
    set title "hits per minute"
    set output 'hits2.png'
    set xrange ["2003/05/24 15:00":"2003/05/24 19:00"]
    set xtics "2003/05/24 00:00", 1800, "2003/05/27 00:00"
    plot 'out2.log' using 1:3 title "Hits" with steps
    





Now that I had my nifty graphs, which of course you need to have people look at your page, I needed to ip addresses out of my access log, which still had the hostname in them.  This was mainly because the other sites that I received access logs from all had hostnames turned off.  This nifty command will parse an access log and print out all the ip addresses:




    
    
    for x in `cat access_log | cut -d ' ' -f 1`; \
          do echo `host $x | sed -e "s/.* has address //"`; done
    
