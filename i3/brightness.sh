#!/bin/bash

INC=0.05
MAX_BRIGHTNESS=1.0
BRIGHTNESS=`xrandr --verbose | awk '/Brightness/ { print $2; exit }'`

if [ $1 == "inc" ]
then
	BRIGHTNESS=`echo "$BRIGHTNESS + $INC" | bc -l`
elif [ $1 == "dec" ]
then
	BRIGHTNESS=`echo "$BRIGHTNESS - $INC" | bc -l`
fi

FILE=/home/lieroz/.config/i3/brightness

if [[ $BRIGHTNESS < "1.01" ]]; then
    PERCENT=`echo "$BRIGHTNESS * 100" | bc -l | cut -f1 -d '.'`
    echo "$PERCENT%" > $FILE
    xrandr --output eDP-1 --brightness $BRIGHTNESS
fi
