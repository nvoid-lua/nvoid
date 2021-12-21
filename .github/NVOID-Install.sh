#!/usr/bin/env bash
set -eo pipefail
function msg() {
  local text="$1"
  local div_width="80"
  printf "%${div_width}s\n" ' ' | tr ' ' -
  printf "%s\n" "$text"
}

declare -a __npm_deps=(
  "neovim"
  "tree-sitter-cli"
)

declare -a __pip_deps=(
  "pynvim"
)


function check_system_deps() {
  if ! command -v git &>/dev/null; then
    print_missing_dep_msg "git"
    exit 1
  fi
  if ! command -v nvim &>/dev/null; then
    print_missing_dep_msg "neovim"
    exit 1
  fi
}

function check_neovim_min_version() {
  local verify_version_cmd='if !has("nvim-0.5.1") | cquit | else | quit | endif'
  if ! nvim --headless -u NONE -c "$verify_version_cmd"; then
    echo "[ERROR]: Nvoid requires at least Neovim v0.5.1 or higher"
    exit 1
  fi
}

function __install_nodejs_deps_npm() {
  echo "Installing node modules with npm.."
  for dep in "${__npm_deps[@]}"; do
    if ! npm ls -g "$dep" &>/dev/null; then
      printf "installing %s .." "$dep"
      npm i -g "$dep" --force
    fi
  done
  echo "All NodeJS dependencies are successfully installed"
}

function install_nodejs_deps() {
  local -a pkg_managers=("npm")
  for pkg_manager in "${pkg_managers[@]}"; do
    if command -v "$pkg_manager" &>/dev/null; then
      eval "__install_nodejs_deps_$pkg_manager"
      return
    fi
  done
  print_missing_dep_msg "${pkg_managers[@]}"
  exit 1
}

function install_python_deps() {
  echo "Verifying that pip is available.."
  if ! python3 -m ensurepip &>/dev/null; then
    if ! python3 -m pip --version &>/dev/null; then
      print_missing_dep_msg "pip"
      exit 1
    fi
  fi
  echo "Installing with pip.."
  for dep in "${__pip_deps[@]}"; do
    pip install "$dep"
  done
  echo "All Python dependencies are successfully installed"
}

function clone() {
   git clone https://github.com/ysfgrgO7/nvoid.git ~/.config/nvim
}
##################################################################################################


## Calling CMD
check_system_deps

check_neovim_min_version

msg "Would you like to install NodeJS dependencies?"
read -p "[y]es or [n]o (default: no) : " -r answer
[ "$answer" != "${answer#[Yy]}" ] && install_nodejs_deps

msg "Would you like to install Python dependencies?"
read -p "[y]es or [n]o (default: no) : " -r answer
[ "$answer" != "${answer#[Yy]}" ] && install_python_deps

clone
