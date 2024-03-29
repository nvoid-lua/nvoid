#!/usr/bin/env bash
set -eo pipefail

NV_INSTALL_PREFIX="${NV_INSTALL_PREFIX:-"$HOME/.local"}"

XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"$HOME/.config"}"

NVIM_APPNAME="${NVIM_APPNAME:-nvoid}"

NVOID_RUNTIME_DIR="${NVOID_RUNTIME_DIR:-"$XDG_DATA_HOME/nvoid"}"
NVOID_CONFIG_DIR="${NVOID_CONFIG_DIR:-"$XDG_CONFIG_HOME/$NVIM_APPNAME"}"
NVOID_CACHE_DIR="${NVOID_CACHE_DIR:-"$XDG_CACHE_HOME/$NVIM_APPNAME"}"
NVOID_BASE_DIR="${NVOID_BASE_DIR:-"$NVOID_RUNTIME_DIR/$NVIM_APPNAME"}"

function setup_shim() {
	local src="$NVOID_BASE_DIR/utils/bin/nvoid.template"
	local dst="$NV_INSTALL_PREFIX/bin/$NVIM_APPNAME"

	[ ! -d "$NV_INSTALL_PREFIX/bin" ] && mkdir -p "$NV_INSTALL_PREFIX/bin"

	# remove outdated installation so that `cp` doesn't complain
	rm -f "$dst"

	cp "$src" "$dst"

	sed -e s"#NVIM_APPNAME_VAR#\"${NVIM_APPNAME}\"#"g \
		-e s"#RUNTIME_DIR_VAR#\"${NVOID_RUNTIME_DIR}\"#"g \
		-e s"#CONFIG_DIR_VAR#\"${NVOID_CONFIG_DIR}\"#"g \
		-e s"#CACHE_DIR_VAR#\"${NVOID_CACHE_DIR}\"#"g \
		-e s"#BASE_DIR_VAR#\"${NVOID_BASE_DIR}\"#"g "$src" |
		tee "$dst" >/dev/null

	chmod u+x "$dst"
}

setup_shim "$@"

echo "You can start Nvoid by running: $NV_INSTALL_PREFIX/bin/$NVIM_APPNAME"
