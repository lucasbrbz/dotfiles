#!/usr/bin/env bash

choice=$(
    printf "Bspwm\nSxhkd\nRofi\nPolybar\nPicom\n" |
    rofi -dmenu -i -p "reset"
)

case "$choice" in
    Bspwm)
        bspc wm -r
        ;;
    Sxhkd)
        pkill -USR1 -x sxhkd
        ;;
    Rofi)
        pkill -x rofi
        ;;
    Polybar)
        ~/.dotfiles/bspwm/scripts/restart-polybar.sh
        ;;
    Picom)
        pkill -x picom 2>/dev/null
        picom &
        ;;
esac
