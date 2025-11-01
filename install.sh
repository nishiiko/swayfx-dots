#!/usr/bin/env bash

read -p "this will copy files into:
$HOME/.config
$HOME/.local
$HOME/Pictures

i dont recommend you actually use this, i made this
for myself where i intend to always nuke my previous config files
please backup your current dots first

you should probably edit $PWD/.config/sway/config.d/monitors before
using the install script

BIG LETTERS SO YOU KNOW THIS IS IMPORTANT
IT WILL RM -RF THESE DIRECTORIES
$HOME/.config/fastfetch
$HOME/.config/foot
$HOME/.config/rofi
$HOME/.config/sway
$HOME/.config/swaync
$HOME/.config/waybar

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

    rm -rf $HOME/.config/fastfetch
    rm -rf $HOME/.config/foot
    rm -rf $HOME/.config/rofi
    rm -rf $HOME/.config/sway
    rm -rf $HOME/.config/swaync
    rm -rf $HOME/.config/waybar
    
    cp -rv --preserve=links .config/* $HOME/.config
    cp -rv --preserve=links .local/* $HOME/.local
    cp -rv --preserve=links Pictures/* $HOME/Pictures
    echo
    echo done
fi
