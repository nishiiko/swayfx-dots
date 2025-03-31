#! /usr/bin/env bash

old=0
while read -r line; do
    echo $visible

    read -r new visible <<< $(echo "$line" | jq '.. | select(.type?) | .id, .visible' | tr '\n' ' ')
	
    if [[ $new -eq $old ]] | [[ ! $visible == 'true' ]]; then
		echo pass
        continue
    else	
		swaymsg [con_id = $old] opacity set 0.75
	fi
    
    swaymsg [con_id = $new] opacity set 0.9
	old=$new

done < <(swaymsg -m -t subscribe '["window"]')
