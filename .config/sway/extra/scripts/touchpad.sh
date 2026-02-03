#!/usr/bin/env bash

while read -r line; do
  state=$(echo "$line" | jq -r 'select(.input.type=="pointer") | .change')

  if [[ $state == 'added' ]]; then
    swaymsg input type:touchpad events toggle disabled
  elif [[ $state == 'removed' ]]; then
    swaymsg input type:touchpad events toggle enabled
  fi

done < <(swaymsg -mt subscribe '["input"]')
