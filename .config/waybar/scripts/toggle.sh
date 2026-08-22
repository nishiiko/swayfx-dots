#!/usr/bin/env bash
read -r state country city <<< $(mullvad status --json | jq -rj '.state, " ", .details.location.country, " ", .details.location.city')

if [ "$state" = "connected" ]; then
  mullvad disconnect
  notify-send "VPN State" "Disconnected from $country, $city" -ae sway-script
else
  mullvad connect
  for i in {1..100}; do
    state=$(mullvad status --json | jq -r '.state')
    if [ "$state" != "connecting" ]; then
      sleep 0.1s
      continue
    fi
    break
  done
  read -r country city <<< $(mullvad status --json | jq -rj '.details.location | .country, " ", .city' | tr '\n' ' ')
  notify-send "VPN State" "Connecting to $country, $city..." -ae sway-script
fi
