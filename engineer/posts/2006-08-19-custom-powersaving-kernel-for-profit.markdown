title: Compiling a custom kernel can save you more than $60 a year!
timestamp: 02:56 PM Saturday, August 19, 2006 EDT
status: published
slug: custom-powersaving-kernel-for-profit
tags:
- kernel
- dsdt
- mythtv
- recompile
- linux
- acpi
- ubuntu
url: /weblog/2006/08/19/custom-powersaving-kernel-for-profit/

layout: post
oldcategories:
- linux
- mythtv
oldtags:
- acpi
- dsdt
- kernel
- linux
- recompile
- ubuntu
wordpress_id: '180'

---

Hey you!  Yes you!  What does your computer do most of the time?  If it's like most computers, it just sits idle.   Sure, some of us may have reasons to leave our computers on all day, such as a web server, or a [mythtv](http://www.mythtv.org/) box, but even then they sit idle. Fortunately, CPU manufacturers have noticed this fact, and developed technologies that allow processors to slow down when not being fully utilized. On Intel chips this is called SpeedStep, and on AMD chips it's called Cool'n'Quiet.

Here's the dirty little secret you may have not known.  Altough the chip you bought may support this wonderful technology, your motherboard may not be able to enable it.  I previously had an AMD Athlon 64 3500+ in an MSI K8N Neo4 Platinum motherboard.  It was really a nice combination, worked pretty zippy. Then, when Conroe dropped at the end of July, I decided to take advantage of the price drops and install a nice new AMD Athlon 64x2 4400+.  After all, it was just a matter of dropping the chip into the board.  When I booted up though, I was greated by something I didn't expect.  The new system was drawing 65 watts more power than the old system was.  Ouch.  A look at the dmesg logs showed exactly what the problem was.

    Aug  2 13:06:39 spongebob kernel: [4294696.356000] powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.50.4)
    Aug  2 13:06:39 spongebob kernel: [4294696.360000] powernow-k8: BIOS error - no PSB or ACPI _PSS objects

That's odd, that can't be normal.  I looked back further in my logs and found this result from my Athlon 64 3500+:
    
    Aug  1 07:10:00 spongebob kernel: [4294691.444000] powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.50.4)
    Aug  1 07:10:00 spongebob kernel: [4294691.444000] powernow-k8:    0 : fid 0xc (2000 MHz), vid 0x6 (1400 mV)
    Aug  1 07:10:00 spongebob kernel: [4294691.444000] powernow-k8:    1 : fid 0xa (1800 MHz), vid 0x8 (1350 mV)
    Aug  1 07:10:00 spongebob kernel: [4294691.444000] powernow-k8:    2 : fid 0x2 (1000 MHz), vid 0x12 (1100 mV)

Time for some fun hacking away at stuff.  Apparently, this means that my motherboard wasn't providing the correct data in the BIOS for the operating system to know how to sleep the processor.  In other words, while my processor could be put to sleep, the motherboard didn't know how to.  The specific item that Linux was looking for is called the Differentiated System Description Table, or DSDT for short.  Lucky for us, there is a feature of Linux that lets you override the motherboard DSDT with one you specify yourself.  Wonderfuly, just hack the DSDT and you've got powersaving!  Wait, you didn't say we're going to hack the firmware of a critical system did you?  Of course I did!  It's not that hard, so let's jump right in!

First things you'll need the Intel ASL compiler/decompiler to build get your DSDT to a readable format.  Under ubuntu this is just a matter of running `sudo apt-get install iasl`.  Now we'll dump the DSDT to a file and then decode it to make it human readable.  Linux is nice in that it makes the DSDT availble at `/proc/acpi/dsdt`

    cat /proc/acpi/dsdt > custom.aml
    iasl -d custom.aml

This should have created a file called custom.dsl. Open it up with your favorite text editor and have a look around.  If you're like me and lacking support for power saving, see a block for your processors that looks a little like this at the top:

        Scope (\_PR)
        {
            Processor (\_PR.CPU0, 0x00, 0x00000000, 0x00) {}
            Processor (\_PR.CPU1, 0x01, 0x00000000, 0x00) {}
        }

The \_PR scope defines ACPI information for your processors.  As you can see here, it's completely empty.  There are a couple of ways to populate it, you can either trust the snippet of code that I'm going to paste below, or you can try to find your own information from the [ACPI4Linux DSDT Repository](http://acpi.sourceforge.net/dsdt/view.php).  You'll need to find a DSDT for a motherboard that is reasonably close to yours, thus if you've got a socket 939 motherboard, like I do, you'll need to find a DSDT for a different socket 939 motherboard. Unfortunately, their site is very difficult to navigate, so if you trust me, you can paste the information here.

    Scope (\_PR)
        {
            Processor (\_PR.CPU0, 0x00, 0x00000000, 0x00)
            {
                Name (_PCT, Package (0x02)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW,
                            0x00,               // Register Bit Width
                            0x00,               // Register Bit Offset
                            0x0000000000000000, // Register Address
                            )
                    },
    
                    ResourceTemplate ()
                    {
                        Register (FFixedHW,
                            0x00,               // Register Bit Width
                            0x00,               // Register Bit Offset
                            0x0000000000000000, // Register Address
                            )
                    }
                })
                Name (_PSS, Package (0x04) // number of p-states
                {
                    Package (0x06)
                    {
                        0x0898, // 2200 MHz
                        0x000105B8,
                        0x64,
                        0x07,
                        0xE020298E,
                        0x018E
                    },
    
                    Package (0x06)
                    {
                        0x07D0, // 2000 MHz
                        0xFCBC,
                        0x64,
                        0x07,
                        0xE0202A0C,
                        0x020C
                    },
    
                    Package (0x06)
                    {
                        0x0708, // 1800 MHz
                        0xD610,
                        0x64,
                        0x07,
                        0xE0202A8A,
                        0x028A
                    },
    
                    Package (0x06)
                    {
                        0x03E8, // 1000 MHz
                        0x6B6C,
                        0x64,
                        0x07,
                        0xE0202C82,
                        0x0482
                    }
                })
                Name (PSXG, Buffer (0x18)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (PSXF, Buffer (0x18)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (PSXE, Buffer (0x18)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (PSXD, Buffer (0x18)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (PSXC, Buffer (0x18)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (PSXB, Buffer (0x18)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Method (_PPC, 0, NotSerialized)
                {
                    Return (Zero)
                }
    
                Name (PSSC, 0x0A)
            }
            Processor (\_PR.CPU1, 0x01, 0x00000000, 0x00)
            {
                Name (APCT, Package (0x02)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW,
                            0x00,               // Register Bit Width
                            0x00,               // Register Bit Offset
                            0x0000000000000000, // Register Address
                            )
                    },
    
                    ResourceTemplate ()
                    {
                        Register (FFixedHW,
                            0x00,               // Register Bit Width
                            0x00,               // Register Bit Offset
                            0x0000000000000000, // Register Address
                            )
                    }
                })
                Name (APSS, Package (0x0A)
                {
                    Package (0x06)
                    {
                        0x09999999,
                        0x00099999,
                        0x00999999,
                        0x00999999,
                        0x99999999,
                        0x99999999
                    },
    
                    Package (0x06)
                    {
                        0x09999999,
                        0x00099999,
                        0x00999999,
                        0x00999999,
                        0x99999999,
                        0x99999999
                    },
    
                    Package (0x06)
                    {
                        0x09999999,
                        0x00099999,
                        0x00999999,
                        0x00999999,
                        0x99999999,
                        0x99999999
                    },
    
                    Package (0x06)
                    {
                        0x09999999,
                        0x00099999,
                        0x00999999,
                        0x00999999,
                        0x99999999,
                        0x99999999
                    },
    
                    Package (0x06)
                    {
                        0x09999999,
                        0x00099999,
                        0x00999999,
                        0x00999999,
                        0x99999999,
                        0x99999999
                    },
    
                    Package (0x06)
                    {
                        0x09999999,
                        0x00099999,
                        0x00999999,
                        0x00999999,
                        0x99999999,
                        0x99999999
                    },
    
                    Package (0x06)
                    {
                        0x09999999,
                        0x00099999,
                        0x00999999,
                        0x00999999,
                        0x99999999,
                        0x99999999
                    },
    
                    Package (0x06)
                    {
                        0x09999999,
                        0x00099999,
                        0x00999999,
                        0x00999999,
                        0x99999999,
                        0x99999999
                    },
    
                    Package (0x06)
                    {
                        0x09999999,
                        0x00099999,
                        0x00999999,
                        0x00999999,
                        0x99999999,
                        0x99999999
                    },
    
                    Package (0x06)
                    {
                        0x09999999,
                        0x00099999,
                        0x00999999,
                        0x00999999,
                        0x99999999,
                        0x99999999
                    }
                })
                Method (APPC, 0, NotSerialized)
                {
                    Return (Zero)
                }
    
                Name (PSSC, 0x0A)
            }
        }

Whew, that's a lot of data.  Don't ask me what it all means either, because I'm not an ACPI expert.  I had to dig around to find a DSDT that worked for me. You'll notice that I have 4 different processor power states, which correspond to the states for the AMD Athlon 64x2 4400+.  If your processor doesn't have four states, such as with an Athlon 64 3500+, then you'll want to comment out the fastest state and change the line that says number of p-states to 3 instead of 4.  Anyway, your mileage may very. You'll also notice that the first value for each p-state corresponds to the speed in MHz.  I'll leave it as an exercise to the reader what sort of damage you can do with that.

Great, now you've got your spiffy new dsl file -- time to compile it and have the kernel load it.  Running the command iasl -tc custom.dsl will produce a file called custom.hex, this is your new compiled DSDT table for inclusion in the kernel.  If you're like me you might have had errors at this point.  If you're smart, you can fix them, if you're lazy you can ignore them. I chose the latter.

Because you're running Ubuntu (right?), the kernel source tree already has support for Cool'n'Quiet by default.  But it doesn't enable drivers that require additional firmware.  Unselect Device Drivers-> Generic Driver Options-> Select only drivers that don't need compile-time external firmware.  Then go to Power management options-> ACPI Support -> Include Custom DSDT and give it the path of your custom.hex file you just created.  Finally, rebuild your kernel with make-kpkg clean && make --append-to-version=-customdsdt kernel_image modules_image kernel_headers initrd.  This will dump a few new .deb files in `/usr/src` for you.  Install them with dpkg -i and reboot!

After the reboot your system will take lots of juice initially, that's because a system is usually pegged during the boot sequence, but afterwards it should drop precipitously.  You can verify it's working by looking at the contents of your dmesg output and see the following:

    [17179571.504000] powernow-k8: Found 2 AMD Athlon 64 / Opteron processors (version 1.50.4)
    [17179571.508000] powernow-k8:    0 : fid 0xe (2200 MHz), vid 0x6 (1400 mV)
    [17179571.508000] powernow-k8:    1 : fid 0xc (2000 MHz), vid 0x8 (1350 mV)
    [17179571.508000] powernow-k8:    2 : fid 0xa (1800 MHz), vid 0xa (1300 mV)
    [17179571.508000] powernow-k8:    3 : fid 0x2 (1000 MHz), vid 0x12 (1100 mV)

If you see something like this, congratulations, it's working quite well.  It's not perfect, I still get a few little error, but at least Cool'n'Quiet works now.  My system idle power dropped from 195W to 134W.  Going off the rough estimate the 1W of power costs about $1/yr, that's a saving of $61!  Nice.  Of course, it took me about four hours to figure this out, which means it may have not been worth it, espeically if I apply a discount rate to my future savings, but I digress.  If you use external proprietary drivers, it might be worth your time to install module-assistant so those get compiled too.  Otherwise you'll boot your nice new kernel without support for 3d acceleration and all that jazz.

After all of this, I found a nice package that allows for the placement of the [DSDT in the initrd](http://gaugusch.at/kernel.shtml).  Using this method, you don't need to recompile your kernel every time you change your DSDT -- instead you just rebuild your initrd.  Very nice for situations where the drivers aren't always built as part of the kernel build process, such as [IVTV](http://www.ivtvdriver.org/).

Happy Hacking!
