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
    chmod +x .config/sway/extra/scripts/pipewire.sh
    chmod +x .config/sway/extra/scripts/xdpw.sh
    chmod +x .config/sway/extra/scripts/floating.sh
    chmod +x .local/bin/screenshot

    cp -v .config/* -r $HOME/.config
    cp -v .local/* -r $HOME/.local
    cp -v Pictures/* -r $HOME/Pictures
    echo
    echo done
fi
