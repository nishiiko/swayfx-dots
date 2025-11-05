#!/usr/bin/env bash
cd $HOME/.config/sway/extra/themes/
read -p "select theme from:
$(ls)
> " theme

if [ ! -e $PWD/$theme ]; then
    echo bruh
fi

echo ok

hyprpicker -rz & disown
sleep 0.2s

killall swww-daemon
killall mpvpaper

ln -sfrv $PWD/$theme/fastfetch/* $HOME/.config/fastfetch/
ln -sfrv $PWD/$theme/alacritty/colours.toml $HOME/.config/alacritty/colours.toml
ln -sfrv $PWD/$theme/rofi/* $HOME/.config/rofi/
ln -sfrv $PWD/$theme/sway/decorations $HOME/.config/sway/config.d/decorations
ln -sfrv $PWD/$theme/sway/hyprlock.conf $HOME/.config/sway/hyprlock.conf
ln -sfrv $PWD/$theme/wallpaper.sh $HOME/.config/sway/extra/scripts/wallpaper.sh
ln -sfrv $PWD/$theme/swaync/style.css $HOME/.config/swaync/style.css
ln -sfrv $PWD/$theme/swaync/config.json $HOME/.config/swaync/config.json
ln -sfrv $PWD/$theme/waybar/colours.css $HOME/.config/waybar/colours.css

swaync-client -R &
swaync-client -rs &
swaymsg reload &
$HOME/.config/sway/extra/scripts/wallpaper.sh &
killall waybar ; waybar &

false
until [ $? -eq 0 ]; do
    swaymsg -r -t get_outputs | jq '.[0].layer_shell_surfaces | .[] | .namespace' | grep waybar &>/dev/null
done

sleep 0.5s;
killall hyprpicker
