#!/usr/bin/env bash

if [ $(swaync-client -D) = "false" ]; then
	paplay $HOME/.config/swaync/se_elevator_ding.ogg --volume=65535
fi
