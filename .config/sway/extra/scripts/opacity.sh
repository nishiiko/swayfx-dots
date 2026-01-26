#!/usr/bin/env bash

old=0
while read -r line; do
  read -r new visible focus <<< $(echo "$line" | jq '.. | select(.type?) | .id, .visible, .focused' | tr '\n' ' ')

  echo $old $new
  echo $visible $focus

  if [[ ! $visible == 'true' ]] || \
     [[ ! $focus == 'true' ]] || \
     [[ $old -eq $new ]]; then
    continue
  else
    swaymsg [con_id = $old] opacity set $1 
  fi
  
  swaymsg [con_id = $new] opacity set $2
  old=$new

done < <(swaymsg -mt subscribe '["window"]')
