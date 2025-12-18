#!/usr/bin/env bash

while read -r line; do
    pkill -RTMIN+8 waybar
done < <(ip monitor link)
