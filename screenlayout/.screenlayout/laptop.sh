#!/bin/sh
. "$(dirname "$0")/common.sh"

xrandr --output eDP-1 --primary --mode 1920x1200 --pos 0x0 --rotate normal $(off_args eDP-1)

bspc monitor eDP-1 -d 1 2 3 4 5 6 7 8 9 10

restart_polybar
save_layout
