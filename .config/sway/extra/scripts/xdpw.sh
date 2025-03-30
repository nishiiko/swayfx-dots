#!/usr/bin/env bash
sleep 1
killall -e xdg-desktop-portal-wlr
killall xdg-desktop-portal
/usr/libexec/xdg-desktop-portal-wlr &
/usr/libexec/xdg-desktop-portal-gtk &
sleep 2
/usr/libexec/xdg-desktop-portal &
