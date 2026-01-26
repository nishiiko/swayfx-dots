#!/usr/bin/env bash

if swaymsg -rt get_inputs | jq '.[] | select(.type=="touchpad")' | grep '"dwt": "disabled"' &>/dev/null; then
  swaymsg input "type:touchpad" dwt enabled
  notify-send "DWT Toggle" "DWT Enabled" -ea sway-script
else
  swaymsg input "type:touchpad" dwt disabled
  notify-send "DWT Toggle" "DWT Disabled" -ea sway-script
fi
