#!/usr/bin/env bash

choice=$(
    printf "Lock\nSuspend\nReboot\nPoweroff\n" |
    rofi -dmenu -i -p "system"
)

case "$choice" in
    Lock)
        betterlockscreen -l
        ;;
    Suspend)
        systemctl suspend
        ;;
    Reboot)
        systemctl reboot
        ;;
    Poweroff)
        systemctl poweroff -i
        ;;
esac
