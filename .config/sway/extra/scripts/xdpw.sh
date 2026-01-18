#!/usr/bin/env bash

if ! grep -r systemd /sbin/init; then
  sleep 1
  pkill -f xdg-desktop-portal
  /usr/libexec/xdg-desktop-portal-gtk &
  /usr/libexec/xdg-desktop-portal-wlr &
fi
