#!/bin/sh
. "$(dirname "$0")/common.sh"

EXT=$(external_monitor)
if [ -z "$EXT" ]; then
  echo "No external monitor detected" >&2
  exit 1
fi

xrandr \
  --output eDP-1 --mode 1920x1200 --pos 0x1080 --rotate normal \
  --output "$EXT" --auto --primary --pos 0x0 --rotate normal \
  $(off_args eDP-1 "$EXT")

bspc monitor eDP-1 -d 1 2 3 4 9 10
bspc monitor "$EXT" -d 5 6 7 8

restart_polybar
save_layout
