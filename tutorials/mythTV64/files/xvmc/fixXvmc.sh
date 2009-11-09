#!/bin/sh
# bang away on XVMC until it works
ROUNDS=0
for x in $(seq 1 100); do
	LINE=$(~/bin/mplayer -vo xvmc -vc ffmpeg12mc ~/bin/fix.mpg -ao none 2>&1 | grep "End of file")
	if [ "x$LINE" == "xExiting... (End of file)" ]; then
		echo "Took ${ROUNDS} tries to succeed"
		exit
	fi
	ROUNDS=$x
done
echo "Unable to initialize xvmc"
