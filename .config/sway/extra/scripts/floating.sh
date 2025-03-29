#!/usr/bin/env bash

while true; do
	read -r windowID floatingState <<< $(swaymsg -t subscribe '["window"]' | jq '.. | select(.type?) | .id, .type' | tr '\n' ' ')

    if [[ $floatingState == '"con"' ]]; then
		swaymsg [con_id = $windowID] border normal 4
    fi
	if [[ "$floatingState" == '"floating_con"' ]]; then
		swaymsg [con_id = $windowID] border pixel 4
	fi

    if pgrep sway &>/dev/null;
        continue
    else
        exit
    fi

done
