#!/usr/bin/env bash

choice=$(
    printf "Laptop\nExtend\nMirror\nSecondary Only\nHome Office\nOnsite\n" |
    rofi -dmenu -i -p "layout"
)

case "$choice" in
    Laptop)
        ~/.screenlayout/laptop.sh
        ;;
    Extend)
        ~/.screenlayout/extend.sh
        ;;
    Mirror)
        ~/.screenlayout/mirror.sh
        ;;
    "Secondary Only")
        ~/.screenlayout/secondary.sh
        ;;
    "Home Office")
        ~/.screenlayout/homeoffice.sh
        ;;
    Onsite)
        ~/.screenlayout/onsite.sh
        ;;
esac
