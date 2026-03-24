#!/usr/bin/env bash

choice=$(
    printf "lock\nsuspend\nreboot\nshutdown\n" |
    rofi -dmenu -i -p "system" -theme ~/.config/rofi/theme.rasi
)

case "$choice" in
    lock)
        betterlockscreen -l
        ;;
    suspend)
        systemctl suspend
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff -i
        ;;
esac
