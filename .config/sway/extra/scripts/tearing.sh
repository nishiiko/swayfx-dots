#!/usr/bin/env bash

tearing_state=$(swaymsg -r -t get_outputs | jq '.. | select(.type?) | .allow_tearing')
workspace=$(swaymsg -r -t get_workspaces | jq '.[] | select(.focused==true).name')
if $tearing_state; then
  swaymsg output '*' allow_tearing no
  notify-send "Tearing Toggle" "Tearing Disabled" -e -a sway-script
else
  swaymsg output '*' allow_tearing yes
  notify-send "Tearing Toggle" "Tearing Enabled" -e -a sway-script
fi
