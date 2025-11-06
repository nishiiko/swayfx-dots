#!/usr/bin/env bash
killall xdg-desktop-portal
killall xdg-desktop-portal-gtk
killall xdg-desktop-portal-wlr
sleep 1
/usr/lib*/xdg-desktop-portal-wlr -r &
/usr/lib*/xdg-desktop-portal-gtk -r &
sleep 2
/usr/lib*/xdg-desktop-portal -r &
