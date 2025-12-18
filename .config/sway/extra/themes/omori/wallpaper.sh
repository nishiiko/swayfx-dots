#!/usr/bin/env bash
swww-daemon & disown
sleep 0.2s
swww img $HOME/.config/sway/extra/themes/omori/omori.png
