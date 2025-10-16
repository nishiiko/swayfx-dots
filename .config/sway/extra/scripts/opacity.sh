#!/usr/bin/env bash

old=0
while read -r line; do
    read -r new visible focus <<< $(echo "$line" | jq '.. | select(.type?) | .id, .visible, .focused' | tr '\n' ' ')

    echo $old $new
    echo $visible $focus

    if [[ $old -eq $new ]] || [[ ! $visible == 'true' ]] || [[ ! $focus == true ]]; then
        continue
    else    
        swaymsg [con_id = $old] opacity set $1 
    fi
    
    swaymsg [con_id = $new] opacity set $2
    old=$new

done < <(swaymsg -m -t subscribe '["window"]')
