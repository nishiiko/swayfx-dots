#!/usr/bin/env bash
filename=$HOME/Pictures/Screenshots/$(date +'Screenshot_%Y-%m-%d_%H-%M-%S.png')
lockdir=$HOME/.tmpSwayCapture/
tmpregion=$lockdir/tmpCapture
monitor=$(swaymsg -rt get_outputs | jq -r '.[] | select(.focused==true).name')

if [ -e $lockdir ]; then
  echo 'Lock detected - Remove this directory:'
  echo $lockdir
  exit
fi

freeze() { #i hope its guaranteed at least
if command -v hyprpicker > /dev/null; then
  hyprpicker -rzn &
  false
  until [ $? -eq 0 ]; do
    swaymsg -rt get_outputs \
    | jq '.[0].layer_shell_surfaces | .[] | .namespace' \
    | grep hyprpicker &>/dev/null
  done
fi
}

selectArea() { # i swear this is all necessary just to launch slurp above hyprpicker i promise
time1=$(date +%s%3N)
until [ ! -z "$area" ]; do
  area=$(slurp -d -c ffffffff -b 00000088 -w 3)
  time2=$(date +%s%3N)
  elapsed=$(($time2-$time1))
  if [[ $elapsed -gt 250 ]]; then
    break
  fi
  time1=$time2
done
}

mkdir -p $lockdir 2>/dev/null
trap 'rm -rf $lockdir & pkill hyprpicker 2>/dev/null' EXIT

case $1 in
  --region)
    type="Region"
    freeze
    selectArea
    if [ -n "$area" ]; then
      grim -l 1 -g "$area" $tmpregion 
      gm convert $tmpregion -shave 4x4 PNG:$filename
    fi
  ;;

  --display)
    type="$monitor"
    grim -l 1 -o "$monitor" $filename
  ;;

  --all)
    type="Desktop"
    grim -l 1 $filename
  ;;

  *)
    echo "
  Flags:

    --region (Screenshots a selected region)
    --display (Screenshots current active monitor)
    --all (Screenshots all monitors/entire desktop)

  why are you using this in your terminal anyways
    "
    notify-send "Screenshot Error" "Flag written incorrectly"
  ;;
esac

if [ -f "$filename" ]; then
  wl-copy < $filename &
  $(notify-send "$type Screenshot" "Saved to $filename" --icon=$filename -a Screenshot -A "xdg-open $filename=View screenshot") &
fi

exit
