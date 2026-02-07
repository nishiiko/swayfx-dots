#!/usr/bin/env bash

while read -r line; do

  read -r windowID floatingState <<< $(echo $line | jq -r '.container | .id, .type' | tr '\n' ' ')

  if [[ $floatingState == 'floating_con' ]]; then
    swaymsg [con_id = $windowID] border pixel 4
  else
    swaymsg [con_id = $windowID] border normal 6
  fi;

done < <(swaymsg -mt subscribe '["window"]')
