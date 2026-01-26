#!/usr/bin/env bash
sleep 0.1s

waybar &

until swaymsg -rt get_outputs \
  | jq '.[0].layer_shell_surfaces | .[] | .namespace' \
  | grep waybar; do

  continue
done

pkill -RTMIN+8 waybar
