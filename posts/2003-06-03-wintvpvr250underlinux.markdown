title: WinTV PVR 250 Under Linux
timestamp: 02:42 PM Tuesday, June 03, 2003 EDT
status: published
slug: wintvpvr250underlinux
tags:
- old
url: /weblog/2003/06/03/wintvpvr250underlinux/

layout: post
oldcategories:
- old
wordpress_id: '72'

---

On Memorial Day, CompUSA had a really good sale on WinTV PVR 250 hardware MPEG encoder cards.  I had been thinking about getting one for a while now, but they were too much on eBay.  Well, after using a few tricks, the final price will be $75 after rebate.  The card showed up on Thursday morning.  What follows is how I got it working.





#### Major References





This guide will tell you how to get the card running with MythTV and LIRC.  Here are some of the sites that will be very helpful to you on your quest.







  * 
[ivtv.sf.net](http://ivtv.sf.net/) - this is where the driver for the WinTV PVR 250 lives


  * 
[www.mythtv.org](http://www.mythtv.org/) - the permier PVR app for linux


  * 
[www.lirc.org](http://www.lirc.org/) - linux infrared remote control project




#### Kernel Recompiling





If you're afraid of recompiling the kernel, abandon all hope and turn back now.  I've heard that if you have RedHat 9, that you're in good shape as it already has Video4Linux2 installed.  If you're using something else, like RedHat 7.3 (or gentoo, or debian....), then you're going to need to do this.






The first step is to go download the kernel sources from [kernel.org](http://www.kernel.org/).  You'll need at least 2.4.20 for this to work.  The next thing you'll need is the kernel patches for the new video for linux drivers.  You can find these at [http://bytesex.org/patches](http://bytesex.org/patches).  I recommend getting the all in one patch because you don't need to worry about order then.  Now it's time for some patching fun.  Apply the patch the the kernel.  This can be done by copying the patch to your **/usr/src/linux** after unpacking the new kernel.  Then you can patch your kernel using the following procedure (the output is for kernel 2.4.20 with [this patch](http://bytesex.org/patches/2.4.20/patch-2.4.20-kraxel.gz)):




    
    
    # <b>gzip -dc [patchfile.gz] | patch -p1</b>
    patching file arch/x86_64/config.in
    patching file drivers/media/video/videodev.c
    patching file Documentation/Configure.help
    patching file Documentation/scsi-changer.txt
    patching file arch/sparc64/config.in
    patching file arch/sparc64/kernel/ioctl32.c
    patching file drivers/scsi/Config.in
    patching file drivers/scsi/Makefile
    patching file drivers/scsi/ch.c
    patching file include/linux/chio.h
    patching file include/linux/major.h
    patching file include/scsi/scsi.h
    patching file drivers/media/video/Makefile
    patching file drivers/media/video/v4l1-compat.c
    patching file drivers/media/video/v4l2-common.c
    patching file include/linux/videodev.h
    patching file include/linux/videodev2.h
    patching file drivers/media/video/bt832.c
    patching file drivers/media/video/bt832.h
    patching file drivers/media/video/bt848.h
    patching file drivers/media/video/bttv-cards.c
    patching file drivers/media/video/bttv-driver.c
    patching file drivers/media/video/bttv-if.c
    patching file drivers/media/video/bttv.h
    patching file drivers/media/video/bttvp.h
    patching file Documentation/video4linux/bttv/CARDLIST
    patching file Documentation/video4linux/bttv/Cards
    patching file Documentation/video4linux/bttv/Sound-FAQ
    patching file drivers/media/video/audiochip.h
    patching file drivers/media/video/msp3400.c
    patching file drivers/media/video/tda7432.c
    patching file drivers/media/video/tda9875.c
    patching file drivers/media/video/tda9887.c
    patching file drivers/media/video/tvaudio.c
    patching file drivers/media/video/tvaudio.h
    patching file drivers/media/video/tvmixer.c
    patching file drivers/media/video/tuner.c
    patching file drivers/media/video/tuner.h
    





Now comes the part of kernel compilation that everyone loves.  Wading through pages and pages of options for devices that no one has used for 10 years to get to the stuff that you need.  You'll need to make sure that **CONFIG_I2C**, **CONFIG_I2C_ALGOBIT**, **CONFIG_VIDEO_DEV** and **CONFIG_VIDEO_PROC_FS** are all set.  If you can do it as a module, that would probably be helpful.  I might have forgotten a few things here.  So don't kill me.  I hate kernel compiling.






Wash, rinse, repeat until your shiny new kernel works.  There is plenty of stuff out there on how to install a kernel, so don't ask me.  Go read [the docs](http://www.tldp.org/).





#### Driver Compiling





After you've managed to recompile your kernel you need to go and compile the drivers.  You can fetch the CVS drivers off [ivtv.sf.net](http://ivtv.sf.net/).  Follow the instructions posted in the FAQ about how to get it to work.  It is very important that you not miss the section about ripping the firmware from the CDROM.  Without the firmware the drivers will not work.






After you've made the drivers you need to add some lines to your **/etc/modules.conf** file to automatically load the appropriate modules.




    
    
    # WinTV PVR 250
    alias char-major-81 videodev
    alias char-major-81-0 ivtv
    options ivtv debug=1 mpg_buffers=32
    options tuner type=2
    options msp3400 once=1 simple=1
    add below ivtv msp3400 saa7115 tuner
    





If you have another tuner card in your system that is /dev/video0, you will probably need to change the **alias char-major-81-0 ivtv** to the approriate reference to /dev/videoX (where X is the id of your ivtv card).  You can find this by running **ivtv/utils/ivtvfwextract.pl --use-encoder-image=2**.  You may need to change that value for encoder image, but that's what worked for me.





#### XMLTV Fun





One of the major components that is needed for MythTV to function properly is XMLTV.  This is a perl module that you can pick up from [http://membled.com/work/apps/xmltv/](http://membled.com/work/apps/xmltv/).  There are nice pacakges for Redhat 9 on there, but we're not using RedHat 9, so we need to compile it from source.  There is a good chance that this will require some extra packages, this is where **perl -MCPAN -e shell** quickly becomes your friend.  As it complains about packages not being installed, install them.  You should be in good shape after this.






Lucky for you, this is going to lead up to how to install MythTV.  MythTV doesn't require you do any complex setup for XMLTV, so don't worry about setup for now.





#### LIRC





Now you'll probably want to get that cool remote control of yours working.  This can be accomplished via the **lirc_i2c** module of lirc.  Just compile the module using the standard methods.  If for some reason the **lirc_i2c** module doesn't work correctly, you should try running the command: **./configure --with-driver=hauppauge** to ensure it gets compiled.  Then you'll want to install the drivers and make sure that everything is good in your **/etc/modules.conf**.  Make sure to add these lines:




    
    
    # lirc stuff
    alias char-major-61 lirc_i2c
    





The next step is to copy the configuration file to the **/etc/lircd.conf**.  You shouldn't have to worry about training your remote and making your own configuration file because the ivtv driver comes with a remote file for the remote.  In my case I have the gray remote, so I copied **ivtv/utils/lircd-g.conf** to **/etc/lircd.conf** and everything seemed to work fine.






The final step is probably the most annoying.  You still need to configure your remote control by creating your own **~/.lircrc** file.  I'm not going to list the entire contents of my file here.  But, you can download it [my .lircrc](/misc/dotlircrc) file.  It is preconfigured for mplayer and irxevent, which is what MythTV uses.





#### MythTV





The last thing that you'll want to do is install [MythTV](http://www.mythtv.org/).  Installing this will make your friends wish they were as cool as you and feel shame because they still run windows.  It really has the potential to be a "killer application" for Linux.






I'm not going into the details on how to get mythtv running.  There is lots of documentation on the mythtv website that I would suggest you read.  It's not an easy program to install as it requires MySQL in addition to the stuff above, but you should really enjoy it.





#### Random Helpful Tips




If you just want to watch some live TV without installing MythTV, you can use the ghetto mplayer trick.  Using a command line like **mplayer -vo xv /dev/video -cache 65536** will provide live TV with a short buffer for pausing the screen.  In reality you need more than a 64 meg cache to really make it productive.






One thing that I've found really helpful is to have some aliases set up so I can do some easier manipulation of the card via the command line.  I've pased them here (for Bash), in hopes that they might help you:




    
    
                    alias test_ioctl='~patrick/ivtv/ivtv/utils/test_ioctl'
                    alias tvsmall='test_ioctl -f width=400,height=300'
                    alias tvmed='test_ioctl -f width=512,height=384'
                    alias tvlarge='test_ioctl -f width=720,height=480'
                    alias tvqmed='test_ioctl -c bitrate=4000000,bitrate_peak=10000000'
                    alias tvqhigh='test_ioctl -c bitrate=8000000,bitrate_peak=16000000'
                    alias tvqlow='test_ioctl -c bitrate=2500000,bitrate_peak=5000000'
                    alias ptune='/home/patrick/ivtv/ivtv/utils/ptune.pl --channel'
                    alias noghost='test_ioctl --set-codec-params=dnr_mode=0,dnr_temporal=0'
    





The first three (**tvsmall**, **tvmed**, **tvlarge**) set the resolution that the card captures video at.  The next three (**tvqhigh**, **tvqmed**, **tvqlow**) set the quality taht the bit stream is recorded at.  **ptune** is a simple alias so you can change the channel.  Finally, **noghost** can be used if your card is getting weird ghosts that wouldn't be there on a normal TV.






As a side note, when I first started, I almost used [freevo](http://freevo.sf.net/) instead of MythTV because I could get it to work better and faster.  I gave MythTV one last shot before I was to kill it, and was able to make it sing.  There are a few tricks you should know.  First of all, running the UI for MythTV at a resolution other than 800x600 will incur a performance penalty as everything has to be scaled.  There are options in the program to force it to run at a certain resolution, use them.  Secondly, if you have a slower computer, turn off deinterlacing.  This is covered in the FAQ for mythtv, but reading the mailing list indicates that a lot of people miss this entirely.  Lastly, if it is really slow on playback, lower the video quality to a lower resolution.  The default is full frame maximum quality, which while fine for an Athlon XP 3200+, doesn't cut it on my Athlon 700.

