#!/bin/sh

device=$(bluetoothctl devices Connected | head -n1 | cut -d" " -f3-)

if [ -n "$device" ]; then
  printf "%s  %s\n" "󰂱" "$device"
else
  printf "%s  Off\n" "󰂲"
fi
