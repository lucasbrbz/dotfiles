#!/bin/sh
. "$(dirname "$0")/common.sh"

EXT=$(external_monitor)
if [ -z "$EXT" ]; then
  echo "No external monitor detected" >&2
  exit 1
fi

xrandr \
  --output eDP-1 --primary --mode 1920x1200 --pos 0x1080 --rotate normal \
  --output "$EXT" --mode 1920x1080 --pos 0x0 --rotate normal --rate 180.00 \
  --output DP-4 --mode 1920x1080 --pos 1920x130 --rotate left --rate 144.00 \
  $(off_args eDP-1 "$EXT" DP-4)

bspc monitor eDP-1 -d 1 2 3
bspc monitor "$EXT" -d 5 6 7 8 10
bspc monitor DP-4 -d 4 9

restart_polybar
save_layout
