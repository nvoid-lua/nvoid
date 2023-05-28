#!/usr/bin/env bash
set -eo pipefail

ARGS_REMOVE_BACKUPS=0

declare -r XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
declare -r XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}"
declare -r XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"$HOME/.config"}"

declare -r NVOID_RUNTIME_DIR="${NVOID_RUNTIME_DIR:-"$XDG_DATA_HOME/nvoid"}"
declare -r NVOID_CONFIG_DIR="${NVOID_CONFIG_DIR:-"$XDG_CONFIG_HOME/nvoid"}"
declare -r NVOID_CACHE_DIR="${NVOID_CACHE_DIR:-"$XDG_CACHE_HOME/nvoid"}"

declare -a __nvoid_dirs=(
  "$NVOID_CONFIG_DIR"
  "$NVOID_RUNTIME_DIR"
  "$NVOID_CACHE_DIR"
)

function usage() {
  echo "Usage: uninstall.sh [<options>]"
  echo ""
  echo "Options:"
  echo "    -h, --help                       Print this help message"
  echo "    --remove-backups                 Remove old backup folders as well"
}

function parse_arguments() {
  while [ "$#" -gt 0 ]; do
    case "$1" in
      --remove-backups)
        ARGS_REMOVE_BACKUPS=1
        ;;
      -h | --help)
        usage
        exit 0
        ;;
    esac
    shift
  done
}

function remove_nvoid_dirs() {
  for dir in "${__nvoid_dirs[@]}"; do
    rm -rf "$dir"
    if [ "$ARGS_REMOVE_BACKUPS" -eq 1 ]; then
      rm -rf "$dir.{bak,old}"
    fi
  done
}

function remove_nvoid_bin() {
  local legacy_bin="/usr/local/bin/nvoid "
  if [ -x "$legacy_bin" ]; then
    echo "Error! Unable to remove $legacy_bin without elevation. Please remove manually."
    exit 1
  fi

  nvoid_bin="$(command -v nvoid 2>/dev/null)"
  rm -f "$nvoid_bin"
}

function main() {
  parse_arguments "$@"
  echo "Removing Nvoid binary..."
  remove_nvoid_bin
  echo "Removing Nvoid directories..."
  remove_nvoid_dirs
  echo "Uninstalled Nvoid!"
}

main "$@"
