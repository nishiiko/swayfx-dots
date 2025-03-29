#! /usr/bin/env bash

# shoutout to u/falxfour on r/swaywm!

old=0
while true; do
	new=$(swaymsg -t subscribe '["window"]' | jq '.. | select(.type?) | .id')
	if [[ $new -eq $old ]]; then
		continue
	fi
	if [[ $old -ne 0 ]]; then
		swaymsg [con_id = $old] opacity set 0.8
	fi
	swaymsg [con_id = $new] opacity set 0.95
	old=$new
done
