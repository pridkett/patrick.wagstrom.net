title: Taking "nice" Processes Into Account With Powernowd
timestamp: 12:31 PM Wednesday, February 04, 2009 EST
status: published
slug: taking-nice-processes-into-account-with-powernowd
tags:
- linux
- mythtv
- powernowd
- nice
url: /weblog/2009/02/04/taking-nice-processes-into-account-with-powernowd/

layout: post
oldcategories:
- linux
oldtags:
- linux
- mythtv
- nice
- powernowd
wordpress_id: '641'

---

Almost every modern CPU supports the ability to dynamically change its clock frequency -- typically done to save power when there are lesser requirements placed on the system.  While the benefits for a laptop are obvious, more battery life and less heat, they may be a bit harder to understand for a desktop machine.  One application, however, where you should be particularly aware of CPU frequency scaling is with media center boxes.  The less often the CPU needs to speed up, the less heat, the quieter the fan, and the lower your power bill.  On my system, the differences can be pretty dramatic, with the CPU taking an extra 20-30 watts when running at full speed versus slower rates.

Within Linux, there are numerous ways that the CPU frequency is controlled, for example with [powernowd](http://deater.net/john/powernowd.html) or the kernel level [ondemand governor](http://www.linuxinsight.com/ols2006_the_ondemand_governor.html), which is the default with most Linux distributions.  One of the aspects of these technologies is that when the system is heavily loaded with processes with high "nice" levels, the CPU will not speed up.  For most cases this is fine, but when running a MythTV box, it may be desirable to allow nice processes to increase the CPU speed -- particularly as these nice processes may be things like transcoding or commercial cutting jobs.  Allowing the CPU to ramp up is particular helpful for evenings where many programs are recorded.  On a Monday night where my MythTV box grabs five HD programs, without allowing the CPU to speed up, it can take over a day to commercial flag and trascode everything.  When the CPU can speed up this time drops to about 8 hours.

Under Ubuntu the default configuration is to use the "ondemand" governor, which means there is no daemon running and the CPU will scale with demand and load.  However, there is nasty line buried in the /etc/init.d/powernowd startup script:

    :::bash
        use_ondemand() {
            if [ "$OPTIONS" != "-q" ]; then
                return 1
            fi
            status=1  # return error, if no cpu dirs are found
            for x in /sys/devices/system/cpu/cpu[0-9]*/; do
                if [ ! -d $x ] || [ ! -f $x"cpufreq/scaling_governor" ]; then
                    continue
                fi
                echo -n ondemand > $x"cpufreq/scaling_governor"
                status=$?
                if [ $status != 0 ]; then
                return $status
                fi
                # The default behaviour of powernowd is to ignore nice load:
                if [ -f $x"cpufreq/ondemand/ignore_nice_load" ]; then
                    echo -n 1 > $x"cpufreq/ondemand/ignore_nice_load"
                fi
            done
            return $status
        }


Line 108 is the culprit of our problems.  By echoing the string `1` to `/sys/devices/system/cpu/cpu[0-9]*/cpufreq/ondemand/ignore_nice_load`, the ondemand governor will not take into account nice loads.  Under previous versions of [Ubuntu](http://www.ubuntu.com/), or when you're not using ondemand and actually need powernowd to run, this change was easily done [altering some settings in /etc/defaults](/weblog/2006/01/13/faster-transcoding/) as I detailed 3 years ago.  However, now you need to hack the script yourself.  The simplest way is just to change the `1` to a `0` on line 102 of `/etc/init.d/powernowd`, giving the following line:


                    echo -n 0 > $x"cpufreq/ondemand/ignore_nice_load"


Change this setting, then you can either reboot, or run `/etc/init.d/powernowd restart` as root.  If you watch your CPU speed (check out /proc/cpuinfo), you should notice that nice processes now speed up the CPU.
