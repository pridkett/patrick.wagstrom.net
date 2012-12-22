title: RandomWipe
timestamp: 09:39 PM Sunday, September 11, 2005 EDT
status: published
slug: randomwipe
tags:
- code
- zip
- python
- security
- randomwipe
url: /weblog/2005/09/11/randomwipe/

layout: post
oldcategories:
- python
oldtags:
- code
- python
- randomwipe
- security
- zip
wordpress_id: '296'

---

I'm in the process of getting rid of a bunch of stuff laying around the
house.  One of these things that I'll never use again is my Parallel Port
zip drive.  In fact, I haven't been able to use it for the last three years
because I lost the power supply.  Last spring, [my department](http://www.epp.cmu.edu/) was giving away some stuff, and one of them was a zip drive.
At the time I thought it was another parallel port one, but really it was
a SCSI one, with the 25 pin scsi connector, which is the exact same thing
as a parallel cable.  Anyway, long story short, I've been using the power
supply from the SCSI drive to power my parallel port drive and then dump the
data that's relevant back to my hard disk.

Some of this stuff is personal stuff, photos from college that I already
have stored elsewhere, letters, etc.  Some of it is old stuff from when I
worked at [LEC Ltd](http://www.lecltd.com/) and [MyPoints](http://www.mypoints.com/), and some of it is REALLY old -- like my phone
listing from Telemate 4.22 and Telix 3.11; apparently the Gate's three lines
were 858-8218, 858-8219, and 858-8260.  In any case, I'm not so silly
as to think that moving the files off the disks really deletes them (see
[this article by Simson Garfinkel](http://www.simson.net/clips/2003/2003.CSO.04.Hard_disk_risk.htm) or [this article from the BBC](http://news.bbc.co.uk/2/hi/technology/4229550.stm) for more info).

Of course, the proper solution is to do `dd if=/dev/random of=/dev/sda4` a couple of times.  But this is really slow.  You can speed
it up by doing `dd if=/dev/urandom of=/dev/sda4`, and
just hope that no one cracks the pseudo-random nature of `/dev/urandom`.  But
this still can't deal with the issue that my parallel port zip drive is REALLY
REALLY slow.  I'm lazy, impatient, and most importantly, intolerant of my
system coming to a crawl while dumping data to the parallel port.

The next step was to try some big magnets.  My father-in-law repairs appliances
and gave us a bunch of microwave magnetron magnets.  They're mega strong.  I
piled them around the disks and shuffled the pile for a few minutes, but the
disks still read.  I'm lazy, I just want to make retreiving the data
sufficiently difficult without having to wait forever.  Enter RandomWipe.

RandomWipe is a simple little python script that randomly rewrites locations
on a disk with crap from `/dev/urandom`.  You can also have it write over the
initial section of the disk too.  Really quite nice.  Here's the code for
RandomWipe, which I place in the public domain and disclaim all warranty on.
Please note, only this snippet of python code below is in the public domain.

    :::python
    from optparse import OptionParser
    import logging
    import random
    import sys
    
    logging.basicConfig()
    log = logging.getLogger("randomwipe")
    log.setLevel(logging.INFO)
    
    parser = OptionParser()
    parser.add_option("-v","--verbose", dest="verbose",
                      help="verbose debugging",
                      action="store_true", default=False)
    
    parser.add_option("-m","--maxseek", dest="maxseek",
                      help="maximum seek",
                      action="store", default=100000000)
    
    parser.add_option("-i","--iterations",dest="iterations",
                      help="iterations",
                      action="store", default=100)
    
    parser.add_option("-b","--blocksize", dest="blocksize", help="blocksize",
                      action="store", default=1024)
    
    parser.add_option("-f","--fat", dest="fatkiller", help="fat",
                      action="store_true", default=False)
    (options, args) = parser.parse_args()
    if options.verbose:
        log.setLevel(logging.DEBUG)
    
    options.blocksize = int(options.blocksize)
    options.iterations = int(options.iterations)
    options.maxseek = int(options.maxseek)
    if not args[0]:
    print "Usage: randomwipe [OPTIONS] device"
        sys.exit()
    
    f1 = open(args[0],"wb")
    f2 = open("/dev/urandom", "rb")
    if options.fatkiller:
        f1.seek(0)
        f1.write(f2.read(16*1024))
    for x in xrange(options.iterations):
    if options.verbose:
            log.debug("writing count: %d", x)
    if x%10 == 0:
            log.info("writing count: %d", x)
    
        f1.seek(random.randint(0,options.maxseek-options.blocksize))
        f1.write(f2.read(options.blocksize))
    
    f1.close()
    f2.close()


I've been running it using the following set of commands:
`python randomwipe.py /dev/sda4 -b 4096 -i 500 -f && mount -t vfat /dev/sda4 /mnt/image && umount /dev/sda4; mkfs.vfat /dev/sda4`.
This basically goes and writes 4096 bytes of random data in 500 different
locations on the disk and additionally blows away the beginning of the file
allocation table.  It then attempts a mount just to make sure and finally
creates a new filesystem on the disk.  I can process a disk in about a minute
like this with a reasonable assurance of security (what I call good enough).

As an aside, if you're interested in the drives (parallel and scsi) along with
14 100MB disks, let me know.  I give discounts to blog readers.

