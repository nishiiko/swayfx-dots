#!/usr/bin/env bash
cd $HOME/.config/sway/extra/themes/
theme=non-existent-theme

until [ -d $PWD/$theme ]; do

read -p "select theme from:
$(ls)
> " theme
  
if [ ! -d $PWD/$theme ]; then
  echo bruh
fi

done

echo ok

hyprpicker -rznq &

sleep 0.2s

pkill -x mpvpaper
pkill -x swww-daemon

ln -sfrv $PWD/$theme/alacritty/colours.toml $HOME/.config/alacritty/
ln -sfrv $PWD/$theme/fastfetch/* $HOME/.config/fastfetch/
ln -sfrv $PWD/$theme/rofi/background.png $HOME/.config/rofi/
ln -sfrv $PWD/$theme/rofi/colours.rasi $HOME/.config/rofi/
ln -sfrv $PWD/$theme/sway/colours $HOME/.config/sway/config.d/
ln -sfrv $PWD/$theme/swaync/colours.css $HOME/.config/swaync/
ln -sfrv $PWD/$theme/waybar/colours.css $HOME/.config/waybar/
ln -sfrv $PWD/$theme/wallpaper.sh $HOME/.config/sway/extra/scripts/wallpaper.sh

swaync-client -R &
swaync-client -rs &
$HOME/.config/sway/extra/scripts/wallpaper.sh &
pkill -x waybar ; waybar &

swaymsg reload

false
until [ $? -eq 0 ]; do
  swaymsg -r -t get_outputs \
  | jq '.[0].layer_shell_surfaces | .[] | .namespace' \
  | grep waybar &>/dev/null
done

sleep 0.5s

pkill -x hyprpicker
