#!/usr/bin/env bash

if [ $(swaync-client -D) = "false" ]; then
	pw-cat -p --volume 1 $HOME/.config/swaync/GEN_Jump.ogg
fi
