#!/bin/sh
# simple script to toggle the monitor on and off

# for use with LIRC so you can just use the power button your remote control
# to turn the TV on and off


DISP=":0.0"
export XAUTHORITY=$(cat $HOME/.x-authority)
export DISPLAY=$(cat $HOME/.x-display)
STATE=$(xset q | grep Monitor | awk '{print $3}')
STATE=$(xset q | grep "DPMS is" | awk '{print $3}')
echo "Monitor Power Called at: $(date)"
echo "Current Monitor State: ${STATE}"
# if [ "$STATE" == "Enabled" ]; then
	# echo $(date): monitor turned on
	# xset dpms force on
	# xset -dpms
	# xset s reset
	# sox $HOME/bin/pop.wav -v 0.5 -t ossdsp -w -s /dev/dsp
# else
	# echo $(date): monitor turned off
	# xset s blank
	# xset s activate
	# xset +dpms
	# xset dpms force off
	# sox $HOME/bin/whip.wav -v 0.5 -t ossdsp -w -s /dev/dsp
# fi
# exit

if [ -f $HOME/.monitor-state-off ]; then
	echo "Turning monitor on"
	XAUTHORITY=$(cat $HOME/.x-authority) DISPLAY=$(cat $HOME/.x-display) xset dpms force on
	XAUTHORITY=$(cat $HOME/.x-authority) DISPLAY=$(cat $HOME/.x-display) xset -dpms
	XAUTHORITY=$(cat $HOME/.x-authority) DISPLAY=$(cat $HOME/.x-display) xset s reset
	rm $HOME/.monitor-state-off
	sox $HOME/bin/pop.wav -v 0.5 -t ossdsp -w -s /dev/dsp
else
	echo "Turning monitor off"
	XAUTHORITY=$(cat $HOME/.x-authority) DISPLAY=$(cat $HOME/.x-display) xset s blank
	XAUTHORITY=$(cat $HOME/.x-authority) DISPLAY=$(cat $HOME/.x-display) xset s activate
	XAUTHORITY=$(cat $HOME/.x-authority) DISPLAY=$(cat $HOME/.x-display) xset +dpms
	XAUTHORITY=$(cat $HOME/.x-authority) DISPLAY=$(cat $HOME/.x-display) xset dpms force off
	touch $HOME/.monitor-state-off
	sox $HOME/bin/whip.wav -v 0.5 -t ossdsp -w -s /dev/dsp
fi
