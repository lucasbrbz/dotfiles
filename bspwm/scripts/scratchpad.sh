#!/usr/bin/env bash
set -eu

name="${1:?missing scratchpad name}"

case "$name" in
  term)
    class="scratchpad-term"
    cmd=(alacritty
      --class "${class},${class}"
      --title "${class}"
      --config-file ~/.dotfiles/alacritty/scratchpad.toml
      --command /bin/bash -il)
    ;;
  yazi)
    class="scratchpad-yazi"
    cmd=(alacritty
      --class "${class},${class}"
      --title "${class}"
      --config-file ~/.dotfiles/alacritty/scratchpad.toml
      --command /bin/bash -il -c 'yazi')
    ;;
  *)
    echo "unknown scratchpad: $name" >&2
    exit 1
    ;;
esac

# bspc has no selector for matching by WM_CLASS, so walk the window nodes
# and inspect each one's tree via jq instead of relying on xdotool.
win_id=""
for id in $(bspc query -N -n .window); do
  if [ "$(bspc query -T -n "$id" | jq -r '.client.className')" = "$class" ]; then
    win_id="$id"
    break
  fi
done

if [ -z "$win_id" ]; then
  "${cmd[@]}" >/dev/null 2>&1 &
  exit 0
fi

if bspc query -N -n "${win_id}.hidden" >/dev/null 2>&1; then
  # bring it to whatever desktop/monitor is currently focused: "sticky" only
  # keeps it pinned within its own monitor, so this covers switching monitors
  bspc node "$win_id" -d focused
  bspc node "$win_id" -g hidden=off
  bspc node "$win_id" -f
else
  bspc node "$win_id" -g hidden=on
fi