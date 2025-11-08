alias diff='diff --color=auto'
alias picocom='picocom -b 115200 -r -l'

# gitroot: Change directory to the root of the current Git repository
gitroot() {
  local root
  root=$(git rev-parse --show-toplevel 2>/dev/null)
  if [ $? -ne 0 ]; then
    echo "Not inside a Git repository."
    return 1
  fi
  cd "$root" || return
}

xrandr_display_mode() {
  DEFAULT="extend"

  if [ $(xrandr --listmonitors | head -n 1 | cut -d: -f2) -gt 2 ]; then
    DEFAULT="external"
  fi

  MODE="${1:-$DEFAULT}"

  case "$MODE" in
    extend)
      xrandr \
        --output eDP-1 --mode 1920x1200 --rate 60.00 --pos 5120x0 --rotate normal \
        --output DP-2 --mode 2560x1080 --rate 74.99 --pos 2560x0 --rotate normal --primary \
        --output DP-1 --mode 2560x1080 --rate 74.99 --pos 0x0 --rotate normal
      ;;
    mirror)
      COMMON_RES="1920x1080"
      COMMON_RATE="60.00"
      xrandr \
        --output eDP-1 --mode $COMMON_RES --rate $COMMON_RATE --pos 0x0 --rotate normal --primary \
        --output DP-2 --mode $COMMON_RES --rate $COMMON_RATE --pos 0x0 --rotate normal --same-as eDP-1 \
        --output DP-1 -mode $COMMON_RES --rate $COMMON_RATE --pos 0x0 --rotate normal --same-as eDP-1
      ;;
    primary)
      xrandr \
        --output eDP-1 --mode 1920x1200 --rate 60.00 --primary \
        --output DP-2 --off \
        --output DP-1 --off
      ;;
    external)
      xrandr \
        --output eDP-1 --off \
        --output DP-1 --mode 2560x1080 --rate 74.99 --pos 0x0 --rotate normal --primary \
        --output DP-2 --mode 2560x1080 --rate 74.99 --pos 2560x0 --rotate normal
      ;;
    *)
      echo "Usage: xrandr_display_mode [extend|mirror|primary|external]"
      return 1
      ;;
  esac
}

goodbye() {
  xrandr_display_mode primary
  systemctl suspend >/dev/null 2>&1
}

