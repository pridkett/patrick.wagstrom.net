title: Ignoring the iPhone3G in Linux
timestamp: 02:45 PM Thursday, July 31, 2008 EDT
status: published
slug: ignoring-the-iphone3g-in-linux
tags:
- hal
- iphone
- linux
- sun
- dbus
- virtualbox
url: /weblog/2008/07/31/ignoring-the-iphone3g-in-linux/

layout: post
oldcategories:
- linux
oldtags:
- dbus
- hal
- iphone
- linux
- sun
- virtualbox
wordpress_id: '348'

---

About two weeks ago I picked up a pair of iPhone 3G's for me and [Kristina](http://kristina.wagstrom.net/).  So far I've been really happy with them, well, aside from the fact that they're more or less bricks under Linux.  Not complete bricks, I can still download photos off of them, but aside from that they're not much use.  One of the more aggravating issues surrounding this is GNOME's insistence on prompting me to download photos whenever I plug my phone in.  There's an option in the dialog to ignore the device being plugged in, but like most things in Linux, it's broken.

Luckily there is a way that requires way too much work to fix this problem.  The system that causes this headache is called HAL, which is the hardware abstraction layer.  In general it's a good thing because it also makes things like USB memory sticks show up when you plug them in.  There's a nifty little trick you can use to cause HAL to ignore your iPhone 3G when you plug it.  Simply create the file /etc/hal/fdi/preprobe/10-iphone3g.fdi and drop in the following contents:
        
    :::xml
          <deviceinfo version="0.2">
           <device>
             <match int="05ac" key="usb.vendor_id">
               <match int="1292" key="usb.product_id">
                 <merge type="bool" key="info.ignore">true</merge>
               </match>
             </match>
           </device>
         </deviceinfo>


Basically, this code tells the HAL subsystem to ignore anything with a USB vendor_id of 0x05ac and a USB product_id of 0x1292.  If it doesn't seem to work, use the command lsusb to see what the values are for your phone.  Finally, after creating this file, run /etc/init.d/dbus restart as root to fix the problem.  At this point your system should no longer bother you whenever your iPhone 3G gets plugged in.

Now, if the fine folks at [Sun](http://www.sun.com/) could just make it so [VirtualBox](http://www.virtualbox.org/) can [connect to an iPhone](http://www.virtualbox.org/ticket/491) that would be wonderful.
