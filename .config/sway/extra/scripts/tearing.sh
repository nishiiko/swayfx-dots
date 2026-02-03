#!/usr/bin/env bash

tearing_state=$(swaymsg -rt get_outputs | jq -r '.[0] | .allow_tearing')
if $tearing_state; then
  swaymsg output '*' allow_tearing no
  notify-send "Tearing Toggle" "Tearing Disabled" -ea sway-script
else
  swaymsg output '*' allow_tearing yes
  notify-send "Tearing Toggle" "Tearing Enabled" -ea sway-script
fi
