#!/usr/bin/env bash
sleep 1
killall -e xdg-desktop-portal-wlr
killall xdg-desktop-portal
/usr/lib*/xdg-desktop-portal-wlr &
/usr/lib*/xdg-desktop-portal-gtk &
sleep 2
/usr/lib*/xdg-desktop-portal &
