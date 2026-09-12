#!/bin/sh

# every xrandr output name, connected or not
all_outputs() {
  xrandr --query | awk '/ (connected|disconnected)/{print $1}'
}

# first connected output that isn't eDP-1 or DP-4 (the two static ports)
external_monitor() {
  xrandr --query | awk '/ connected/{print $1}' | grep -v -e '^eDP-1$' -e '^DP-4$' | head -n1
}

# "--output X --off" for every output not passed as an argument
off_args() {
  keep=" $* "
  for o in $(all_outputs); do
    case "$keep" in
      *" $o "*) ;;
      *) printf ' --output %s --off' "$o" ;;
    esac
  done
}

restart_polybar() {
  pkill -x polybar 2>/dev/null
  # host the tray on the xrandr primary output only, so it doesn't randomly
  # land on whichever polybar instance wins the systray race
  primary=$(xrandr --query | awk '/ primary/{print $1; exit}')
  right_modules="wired-network wireless-network pulseaudio battery date time"
  for m in $(bspc query -M --names); do
    if [ "$m" = "$primary" ]; then
      MONITOR="$m" RIGHT_MODULES="$right_modules tray" polybar &
    else
      MONITOR="$m" RIGHT_MODULES="$right_modules" polybar &
    fi
  done
}

# remember which layout is active, so a bspwm restart mid-session can reapply
# it instead of falling back to laptop-only. Cleared on logout/reboot since
# it lives under XDG_RUNTIME_DIR.
save_layout() {
  basename "$0" .sh > "${XDG_RUNTIME_DIR:-/tmp}/screenlayout-current"
}
