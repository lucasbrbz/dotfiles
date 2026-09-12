#!/bin/sh
. "$(dirname "$0")/common.sh"

EXT=$(external_monitor)
if [ -z "$EXT" ]; then
  echo "No external monitor detected" >&2
  exit 1
fi

xrandr --output "$EXT" --primary --auto --pos 0x0 --rotate normal $(off_args "$EXT")

bspc monitor "$EXT" -d 1 2 3 4 5 6 7 8 9 10

restart_polybar
save_layout
