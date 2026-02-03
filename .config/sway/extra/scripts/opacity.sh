#!/usr/bin/env bash

old=0
while read -r line; do
  read -r new visible <<< $(echo "$line" | jq -r '.. | select(.type?) | select(.focused==true) | .id, .visible' | tr '\n' ' ')

  if [[ ! $visible ]] || \
     [[ $old -eq $new ]]; then
    continue
  else
    swaymsg [con_id = $old] opacity set $1 
  fi

  swaymsg [con_id = $new] opacity set $2
  old=$new

done < <(swaymsg -mt subscribe '["window"]')
