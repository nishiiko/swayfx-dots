#! /usr/bin/env bash

old=0
while read -r line; do
    read -r new visible focus <<< $(echo "$line" | jq '.. | select(.type?) | .id, .visible, .focused' | tr '\n' ' ')

    if [[ $old -eq $new ]] || [[ ! $visible == 'true' ]] || [[ ! $focus == true ]]; then
        continue
    else	
		swaymsg [con_id = $old] opacity set 0.75
	fi
    
    swaymsg [con_id = $new] opacity set 0.9
	old=$new

done < <(swaymsg -m -t subscribe '["window"]')
