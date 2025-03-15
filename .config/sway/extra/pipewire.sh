#!/usr/bin/bash

pipewire &
pipewire-pulse &
wireplumber &

# paplay --volume=65535 $HOME/.config/sway/extra/startup.wav &
