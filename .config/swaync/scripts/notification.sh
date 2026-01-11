#!/usr/bin/env bash

if [ $(swaync-client -D) = "false" ]; then
	paplay $HOME/.config/swaync/ding.wav --volume=32783
fi
