#!/bin/sh
. "$(dirname "$0")/common.sh"

xrandr \
  --output DP-1 --mode 2560x1080 --rate 74.99 --pos 0x0 --rotate normal --primary \
  --output DP-2 --mode 2560x1080 --rate 74.99 --pos 2560x0 --rotate normal \
  $(off_args DP-1 DP-2)

bspc monitor DP-1 -d 1 2 3 4 5
bspc monitor DP-2 -d 6 7 8 9 10

restart_polybar
save_layout
