#!/usr/bin/env bash

if swaymsg -t get_inputs --raw | jq '.[] | select(.type=="touchpad")' | grep '"dwt": "disabled"' &>/dev/null; then
    swaymsg input "type:touchpad" dwt enabled
    notify-send "DWT Toggle" "DWT Enabled" -e -a sway-script
else
    swaymsg input "type:touchpad" dwt disabled
    notify-send "DWT Toggle" "DWT Disabled" -e -a sway-script
fi
