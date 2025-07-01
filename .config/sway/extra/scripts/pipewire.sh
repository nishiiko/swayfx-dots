#!/usr/bin/env bash

if ! grep -r systemd /sbin/init; then
    pkill -x pipewire\|pipewire-pulse\|wireplumber

    pidwait -x pipewire\|pipewire-pulse\|wireplumber
    
    pipewire &
    pipewire-pulse &

    sleep 1s
    wireplumber &
fi

paplay --volume=65535 $HOME/.config/sway/extra/assets/heal.wav &
