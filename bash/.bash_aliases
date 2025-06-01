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

