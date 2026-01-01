#!/usr/bin/env bash

if ! grep -r systemd /sbin/init \
  && ! ls /usr/bin/ | grep openrc-init; then
  pkill -x pipewire\|pipewire-pulse\|wireplumber

  pidwait -x pipewire\|pipewire-pulse\|wireplumber
  
  pipewire &
  pipewire-pulse &

  sleep 1s
  wireplumber &
fi
sleep 0.5s
paplay --volume=65535 $HOME/.config/sway/extra/assets/startup.wav &
