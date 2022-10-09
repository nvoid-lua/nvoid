#!/usr/bin/env bash
set -eo pipefail

INSTALL_PREFIX="${INSTALL_PREFIX:-"$HOME/.local"}"

XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"$HOME/.config"}"

NVOID_RUNTIME_DIR="${NVOID_RUNTIME_DIR:-"$XDG_DATA_HOME/nvoid"}"
NVOID_BASE16_DIR="${NVOID_BASE16_DIR:-"$XDG_DATA_HOME/nvoid/site/pack/packer/start/base16/lua/base16/highlight"}"
NVOID_CONFIG_DIR="${NVOID_CONFIG_DIR:-"$XDG_CONFIG_HOME/nvoid"}"
NVOID_CACHE_DIR="${NVOID_CACHE_DIR:-"$XDG_CACHE_HOME/nvoid"}"

NVOID_BASE_DIR="${NVOID_BASE_DIR:-"$NVOID_RUNTIME_DIR/nvoid"}"

function setup_shim() {
  local src="$NVOID_BASE_DIR/utils/bin/nvoid.template"
  local dst="$INSTALL_PREFIX/bin/nvoid"

  [ ! -d "$INSTALL_PREFIX/bin" ] && mkdir -p "$INSTALL_PREFIX/bin"

  # remove outdated installation so that `cp` doesn't complain
  rm -f "$dst"

  cp "$src" "$dst"

  sed -e s"#RUNTIME_DIR_VAR#\"${NVOID_RUNTIME_DIR}\"#"g \
    -e s"#BASE16_DIR_VAR#\"${NVOID_BASE16_DIR}\"#"g \
    -e s"#CONFIG_DIR_VAR#\"${NVOID_CONFIG_DIR}\"#"g \
    -e s"#CACHE_DIR_VAR#\"${NVOID_CACHE_DIR}\"#"g "$src" \
    | tee "$dst" >/dev/null

  chmod u+x "$dst"
}

setup_shim "$@"

echo "You can start NVOID by running: $INSTALL_PREFIX/bin/nvoid"
