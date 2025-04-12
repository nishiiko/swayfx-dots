#!/usr/bin/env bash

while read -r line; do
    
    read -r windowID floatingState <<< $(echo "$line" | jq '.. | select(.type?) | .id, .type' | tr '\n' ' ')

    if [[ $floatingState == '"con"' ]]; then
        swaymsg [con_id = $windowID] border normal 6
    elif [[ $floatingState == '"floating_con"' ]]; then
        swaymsg [con_id = $windowID] border pixel 4 
    fi;
    
done < <(swaymsg -m -t subscribe '[ "window" ]')
