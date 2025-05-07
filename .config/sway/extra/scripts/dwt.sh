#!/usr/bin/env bash

if swaymsg -t get_inputs --raw | jq '.[] | select(.type=="touchpad")' | grep '"dwt": "disabled"' &>/dev/null; then
    swaymsg input "type:touchpad" dwt enabled
    notify-send "DWT Toggle" "DWT Enabled" -u critical
else
    swaymsg input "type:touchpad" dwt disabled
    notify-send "DWT Toggle" "DWT Disabled" -u critical
fi

paplay $HOME/.config/swaync/ding.wav --volume=45000 &
