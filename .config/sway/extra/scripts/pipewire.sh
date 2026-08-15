#!/usr/bin/env bash

if ! grep -r systemd /sbin/init; then
	# && ! ls /usr/bin/ | grep openrc-init; then
	gentoo-pipewire-launcher restart &
fi
sleep 3s
pw-cat -p $HOME/.config/sway/extra/assets/heal.wav &
