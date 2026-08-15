#!/usr/bin/env bash
read -r state country city <<< $(mullvad status --json | jq -rj '.state, " ", .details.location.country, " ", .details.location.city')

if [ "$state" = "connected" ]; then
  mullvad disconnect
  notify-send "VPN State" "Disconnected from $country, $city" -ae sway-script
else
  mullvad connect
  until mullvad status --json | grep connecting; do
    :
  done
  read -r country city <<< $(mullvad status --json | jq -rj '.details.location | .country, " ", .city' | tr '\n' ' ')
  notify-send "VPN State" "Connecting to $country, $city..." -ae sway-script
fi
