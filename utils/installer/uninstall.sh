#!/usr/bin/env bash
set -eo pipefail

ARGS_REMOVE_BACKUPS=0
ARGS_REMOVE_CONFIG=0

declare -r XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
declare -r XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}"
declare -r XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"$HOME/.config"}"

declare -xr NVIM_APPNAME="${NVIM_APPNAME:-"nvoid"}"

declare -xr NVOID_RUNTIME_DIR="${NVOID_RUNTIME_DIR:-"$XDG_DATA_HOME/nvoid"}"
declare -xr NVOID_CONFIG_DIR="${NVOID_CONFIG_DIR:-"$XDG_CONFIG_HOME/$NVIM_APPNAME"}"
declare -xr NVOID_CACHE_DIR="${NVOID_CACHE_DIR:-"$XDG_CACHE_HOME/$NVIM_APPNAME"}"
declare -xr NVOID_BASE_DIR="${NVOID_BASE_DIR:-"$NVOID_RUNTIME_DIR/$NVIM_APPNAME"}"

declare -a __nvoid_dirs=(
  "$NVOID_RUNTIME_DIR"
  "$NVOID_CACHE_DIR"
)

__nvoid_config_dir="$NVOID_CONFIG_DIR"

function usage() {
  echo "Usage: uninstall.sh [<options>]"
  echo ""
  echo "Options:"
  echo "    -h, --help                       Print this help message"
  echo "    --remove-config                  Remove user config files as well"
  echo "    --remove-backups                 Remove old backup folders as well"
}

function parse_arguments() {
  while [ "$#" -gt 0 ]; do
    case "$1" in
      --remove-backups)
        ARGS_REMOVE_BACKUPS=1
        ;;
      --remove-config)
        ARGS_REMOVE_CONFIG=1
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
  if [ "$ARGS_REMOVE_CONFIG" -eq 1 ]; then
    __nvoid_dirs+=($__nvoid_config_dir)
  fi
  for dir in "${__nvoid_dirs[@]}"; do
    rm -rf "$dir"
    if [ "$ARGS_REMOVE_BACKUPS" -eq 1 ]; then
      rm -rf "$dir.{bak,old}"
    fi
  done
}

function remove_nvoid_bin() {
  nvoid_bin="$(command -v "$NVIM_APPNAME" 2>/dev/null)"
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
