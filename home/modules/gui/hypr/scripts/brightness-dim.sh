#!/usr/bin/env bash
# Save real backlight brightness ourselves before dimming.
#
# ambxst's own `brightness -s`/`-r` is broken: its brightness_list.sh greps
# `brightnessctl -l` for the substring "backlight", which also matches LED
# devices whose *name* contains "backlight" (e.g. chromeos::kbd_backlight),
# even though their class is "leds". Both get mapped to the same monitor
# ("eDP-1"), so the save file ends up with two conflicting lines and restore
# flickers up then immediately back down to the LED's value.
device=$(brightnessctl -l | grep "'backlight'" | awk -F"'" '{print $2}' | head -1)
current=$(brightnessctl -d "$device" g)
max=$(brightnessctl -d "$device" m)
echo $(( current * 100 / max )) >/tmp/ambxst_brightness_manual_saved.txt

ambxst brightness 10
