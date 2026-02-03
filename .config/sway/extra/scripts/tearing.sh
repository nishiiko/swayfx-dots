#!/usr/bin/env bash

tearing_state=$(swaymsg -rt get_outputs | jq -r '.. | select(.type?) | .allow_tearing')
if $tearing_state; then
  swaymsg output '*' allow_tearing no
  notify-send "Tearing Toggle" "Tearing Disabled" -e -a sway-script
else
  swaymsg output '*' allow_tearing yes
  notify-send "Tearing Toggle" "Tearing Enabled" -e -a sway-script
fi
