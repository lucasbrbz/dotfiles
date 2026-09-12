#!/bin/sh
. "$(dirname "$0")/common.sh"

EXT=$(external_monitor)
if [ -z "$EXT" ]; then
  echo "No external monitor detected" >&2
  exit 1
fi

COMMON_RES="1920x1080"
COMMON_RATE="60.00"

xrandr \
  --output eDP-1 --mode "$COMMON_RES" --rate "$COMMON_RATE" --pos 0x0 --rotate normal --primary \
  --output "$EXT" --mode "$COMMON_RES" --rate "$COMMON_RATE" --pos 0x0 --rotate normal --same-as eDP-1 \
  $(off_args eDP-1 "$EXT")

restart_polybar
save_layout
