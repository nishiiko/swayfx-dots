#!/usr/bin/env bash

lastline=

while read -r line; do
  if [[ $lastline == $line ]] \
  || echo $line | grep Deleted &>/dev/null; then
    pkill -RTMIN+8 waybar
  fi
  if echo $line | grep mullvad &>/dev/null; then
    lastline=$(echo $line)
  fi
done < <(ip monitor link)
