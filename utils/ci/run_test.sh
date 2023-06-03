#!/usr/bin/env bash
set -e

export NVOID_RUNTIME_DIR="${NVOID_RUNTIME_DIR:-"$HOME/.local/share/nvoid"}"
export NVOID_BASE_DIR="${NVOID_BASE_DIR:-"$NVOID_RUNTIME_DIR/nvoid"}"

export NVOID_TEST_ENV=true

# we should start with an empty configuration
NVOID_CONFIG_DIR="$(mktemp -d)"
NVOID_CACHE_DIR="$(mktemp -d)"

export NVOID_CONFIG_DIR NVOID_CACHE_DIR

printf "cache_dir: %s\nconfig_dir: %s\n" "$NVOID_CACHE_DIR" "$NVOID_CONFIG_DIR"

nvoid() {
  nvim -u "$NVOID_BASE_DIR/tests/minimal_init.lua" --cmd "set runtimepath+=$NVOID_BASE_DIR" "$@"
}

if [ -n "$1" ]; then
  nvoid --headless -c "lua require('plenary.busted').run('$1')"
else
  nvoid --headless -c "PlenaryBustedDirectory tests/specs { minimal_init = './tests/minimal_init.lua' }"
fi
