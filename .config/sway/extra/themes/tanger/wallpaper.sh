#!/usr/bin/env bash
swww-daemon --no-cache & disown
sleep 0.2s
swww img $HOME/.config/sway/extra/themes/tanger/tanger.png
