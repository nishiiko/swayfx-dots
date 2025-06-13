#!/usr/bin/env bash

if ! grep -r systemd /sbin/init; then
    killall wireplumber pipewire-pulse pipewire
    
    pipewire &
    pipewire-pulse &

    sleep 1s
    wireplumber &
fi

paplay --volume=65535 $HOME/.config/sway/extra/assets/heal.wav &
