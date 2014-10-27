#!/usr/bin/env bash

# Patrick Wagstrom's Whiz-bang XML->XSLT converter script
# Copyright (c) 2003 Patrick Wagstrom
# Email: wagspat@iit.edu
# web:   http://patrick.wagstrom.net/
#
# This program is released under the terms of the GNU public license

XSLTENGINE=xsltproc
XSLTPARAM="-param dynamic \"'false'\""
ROOTDIR=/www/patrick
FILELIST=`find . -name "*.xml" | grep -v "^./pyblosxom" | grep -v "wedding/pyblosxom" | grep -v "awstats" | grep -v "^./gallery"` 

clean_files()
{
    for x in $FILELIST; do
        rm -f `output_filename $x`
    done
}

xslt_filename()
{
    XSLTSHEET=`grep "<?[ ]*xml-stylesheet" $1 | \
               sed -e "s:^.*<?[ ]*xml-stylesheet.*href=\"\([^\"]*\)\".*$:\1:"`
    echo $ROOTDIR/$XSLTSHEET
}
 
output_filename()
{
    FILEPATH=$1
    FILENAME=`basename $FILEPATH`
    BASENAME=`basename $FILENAME .xml`
    BASEDIR=`echo $FILEPATH | sed -e "s/$FILENAME//"`
    XSLTSHEET=`xslt_filename $1`
    EXTENSION=`grep "xsl:output" $XSLTSHEET | \
               sed -e "s/^.*<[ ]*xsl:output.*method=\"\([^\"]*\)\".*$/\1/"`
    echo $BASEDIR$BASENAME.$EXTENSION
}
 
if [ $1 ]; then
if [ $1 = 'clean' ]; then
	clean_files
	exit
else
	echo "I don't understand argument: $1"
	exit
fi
fi

echo "[ Translating XML Files ]"
for x in $FILELIST; do
    XSLTSHEET=`xslt_filename $x`
    if [ ! -f $XSLTSHEET ]; then
        echo "$x => FAILED"
        BS=`echo $x | sed -e "s/./ /g"`
        echo "$BS    $XSLTSHEET not found"
    else
    OUTPUTFILE=`output_filename $x`
    # if either the XML or XSLT is newer than the outputfile, then redo
    if [ $x -nt $OUTPUTFILE ] || [ $XSLTSHEET -nt $OUTPUTFILE ]; then
        $XSLTENGINE $XSLTPARAM -o $OUTPUTFILE $XSLTSHEET $x
        echo "$x => $OUTPUTFILE"
    fi
    fi
done
echo "[ Done ]"

