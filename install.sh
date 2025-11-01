#!/usr/bin/env bash

read -p "this will copy files into:
$HOME/.config
$HOME/.local
$HOME/Pictures

i dont recommend you actually use this, i made this
for myself where i intend to always nuke my previous config files
please backup your current dots first

i highly advise you edit .config/sway/config.d/monitors before
using the install script, otherwise you may be left with a black
screen if my configs do not match exactly what your monitor(s) can
handle

are you sure you want to run this (y/n): " confirm

if [ $confirm == "y" ]; then
    read -p "are you DEFINITELY sure (y/n): " confirm
else
    exit
fi

countdown=5

if [ $confirm == "y" ]; then
    while [ $countdown -gt 0 ]; do
        echo -ne "your current dots will be nuked in: $countdown\033[0K\r"
        sleep 1
        : $((countdown--))
    done
    
    cp -rv --preserve=links .config/* $HOME/.config
    cp -rv --preserve=links .local/* $HOME/.local
    cp -rv --preserve=links Pictures/* $HOME/Pictures
    echo
    echo done
fi
