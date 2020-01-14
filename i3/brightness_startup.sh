#!/bin/bash

FILE=/home/lieroz/.config/i3/brightness
BRIGHTNESS=`xrandr --verbose | awk '/Brightness/ { print $2; exit }'`
PERCENT=`echo "$BRIGHTNESS * 100" | bc -l | cut -f1 -d '.'`

echo "$PERCENT%" > $FILE
xrandr --output eDP-1 --brightness $BRIGHTNESS
