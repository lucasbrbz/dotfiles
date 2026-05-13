#!/usr/bin/env bash
set -eu

name="${1:?missing scratchpad name}"

case "$name" in
  term)
    class="scratchpad-term"
    title="scratchpad-term"
    cmd=(alacritty
      --class "${class},${class}"
      --title "${title}"
      --config-file ~/.dotfiles/alacritty/scratchpad.toml
      --command /bin/bash -il)
    ;;
  yazi)
    class="scratchpad-yazi"
    title="scratchpad-yazi"
    cmd=(alacritty
      --class "${class},${class}"
      --title "${title}"
      --config-file ~/.dotfiles/alacritty/scratchpad.toml
      --command /bin/bash -il -c 'yazi')
    ;;
  *)  
    echo "unknown scratchpad: $name" >&2
    exit 1
    ;;
esac

win_id="$(xdotool search --all --classname "$class" --name "^${title}$" 2>/dev/null | head -n1 || true)"

if [ -z "$win_id" ]; then
  "${cmd[@]}" >/dev/null 2>&1 &
  exit 0
fi

if bspc query -N -n "${win_id}.hidden" >/dev/null 2>&1; then
  bspc node "$win_id" -g hidden=off
  bspc node "$win_id" -f
else
  bspc node "$win_id" -g hidden=on
fi