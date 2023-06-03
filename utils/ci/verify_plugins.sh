#!/usr/bin/env bash
set -e

BASEDIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
BASEDIR="$(dirname -- "$(dirname -- "$BASEDIR")")"

NVOID_BASE_DIR="${NVOID_BASE_DIR:-"$BASEDIR"}"

nvoid --headless \
  -c "luafile ${NVOID_BASE_DIR}/utils/ci/verify_plugins.lua"
