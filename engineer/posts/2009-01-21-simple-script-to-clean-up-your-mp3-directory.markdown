title: Simple Script to Clean Up Your MP3 Directory
timestamp: 03:42 PM Wednesday, January 21, 2009 EST
status: published
slug: simple-script-to-clean-up-your-mp3-directory
tags:
- iTunes
- shell
- music
- mp3
- script
- linux
- bash
url: /weblog/2009/01/21/simple-script-to-clean-up-your-mp3-directory/

layout: post
oldcategories:
- linux
oldtags:
- bash
- iTunes
- linux
- mp3
- music
- script
- shell
wordpress_id: '619'

---

Since getting an iPhone I've put a bit more care into making sure that all of my music is ripped and available.  My music resides on a [Drobo](http://www.drobo.com/) plugged into my Linux box and shared via Samba to Windows and iTunes.  I've chosen to have iTunes organize my music folder automatically.  One down side of this is that iTunes then names files slightly differently and moves files around.  This resulted in hundreds of directories laying around with no content.  It also made it a pain when I wanted to find the actual file outside of iTunes -- was "Everybody Hurts" in REM, R.E.M, or R.E.M_?  Because iTunes has organized my music only one of those directories has any content in it, I want to nuke the other ones.

I set about to create a script that will look through a directory tree and find all the directories that do not contain any music at lower levels and remove those directories.  Many of the directories have other crufty files in there, but I'm pretty certain there shouldn't be anything other than music and covers in my music repository.  However, this means that I can't just delete everything that isn't a music file, because I want to keep covers in directories that still have music.

I accomplished this via a two stage script that first finds all subdirectories.  Then for each subdirectory find is executed again to get a count of the number of music files in the path.  If there are no music files in the directory, then the directory gets nuked.  Here's the script:


        #!/bin/bash
        
        IFS=$'\n'
        for td in $(find . -type d); do
            FC=$(find "$td" -type f -iname "*.mp3" -or -iname "*.aac" -or -iname "*.m4?"| wc -l)
            if [ $FC == "0" ]; then
                echo "*** $td $FC"
                # uncomment these two lines if you'd like to be prompted to hit return to nuke stuff
                # ls -lR $td
                # read x
                rm -rf "$td"
            fi
        done


There's a couple of commented lines in the middle there that you can uncomment and it will show a directory listing before waiting for you to hit return and nuke the directory.  As near as I can tell this worked perfectly for me, of course, it could easily eat your music files too.
