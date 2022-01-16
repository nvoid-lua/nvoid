#!/bin/env bash

if command -v dpkg &> /dev/null then
  echo Debian is not supported for now
  exit 1
fi

## Checking neovim
pkg_nvim_installed() {
  if command -v pacman &> /dev/null
  then
    echo "sudo pacman -Syu --needed neovim"
  elif command -v xbps-install &> /dev/null
  then
    echo "sudo xbps-install -Syu neovim"
  elif command -v dnf &> /dev/null
  then
   echo "sudo dnf install neovim"
  fi
}
warnnvim() {
  echo "### Neovim is not installed try:"
  echo $(pkg_nvim_installed)
  exit
}
function check_neovim_min_version() {
  local verify_version_cmd='if !has("nvim-0.6.0") | cquit | else | quit | endif'
  if ! nvim --headless -u NONE -c "$verify_version_cmd"; then
    echo "[ERROR]: Nvoid requires at least Neovim v0.6.0 or higher"
    exit 1
  fi
}
check_neovim_min_version

which nvim >/dev/null && echo "Neovim 0.6.0 is installed" || warnnvim

## Checking git
pkg_git_installed() {
  if command -v pacman &> /dev/null
  then
    echo "sudo pacman -Syu --needed git"
  elif command -v xbps-install &> /dev/null
  then
    echo "sudo xbps-install -Syu git"
  elif command -v dnf &> /dev/null
  then
   echo "sudo dnf install git"
  fi
}
warngit() {
  echo "### Git is not installed try:"
  echo $(pkg_git_installed)
  exit
}
which git >/dev/null && echo "Git is installed" || warngit

## Deps
  function install_deps () {
### MSG Function 
  function msg() {
    local text="$1"
    local div_width="80"
    printf "%${div_width}s\n" ' ' | tr ' ' -
    printf "%s\n" "$text"
  }

### npm deps START
  function install_nodejs_deps() {
    pkg_nodejs_install() {
      if command -v pacman &> /dev/null
      then
        echo "sudo pacman -Syu --needed nodejs npm"
      elif command -v xbps-install &> /dev/null
      then
        echo "sudo xbps-install -Syu nodejs"
      elif command -v dnf &> /dev/null
      then
       echo "sudo dnf install nodejs npm"
      fi
    }
    warnnode() {
      echo "### nodejs or npm are not installed try:"
      echo $(pkg_nodejs_install)
      exit
    }
    which node npm && echo "Node and npm are installed" || warnnode
    declare -a __npm_deps=(
      "fd-find"
      "neovim"
      "tree-sitter-cli"
    )
    for deps in "${__npm_deps[@]}"; do
      sudo npm i -g "$deps" --force
    done
  }

  msg "Would you like to install nodejs dependencies?"
  read -p "[y]es or [n]o (default: no) : " -r answer
  [ "$answer" != "${answer#[Yy]}" ] && install_nodejs_deps
### npm deps END

### pip deps START
  function install_pip_deps() {
    pkg_pip_install() {
      if command -v pacman &> /dev/null
      then
        echo "sudo pacman -Syu --needed python-pip"
      elif command -v xbps-install &> /dev/null
      then
        echo "sudo xbps-install -Syu python3-pip"
      elif command -v dnf &> /dev/null
      then
       echo "sudo dnf install python-pip"
      fi
    }
    warnpip() {
      echo "### pip is not installed try:"
      echo $(pkg_pip_install)
      exit
    }
    which pip && echo "pip is installed" || warnpip
    declare -a __pip_deps=(
      "pynvim"
    )
    for deps in "${__pip_deps[@]}"; do
      pip install --force-reinstall "$deps"
    done
  }

  msg "Would you like to install Python dependencies?"
  read -p "[y]es or [n]o (default: no) : " -r answer
  [ "$answer" != "${answer#[Yy]}" ] && install_pip_deps
### pip deps END
}

clone_repo() {
  git clone https://github.com/ysfgrgO7/nvoid.git ~/.config/nvim
}

clone_packer() {
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
   ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

copy_old_config() {
  if [ -d "$HOME/.local/share/nvim" ]; then 
    mv ~/.local/share/nvim ~/.local/share/NV.old
  fi
  if [ -d "$HOME/.config/nvim" ]; then 
    mv ~/.config/nvim ~/.config/NV.old
  fi
}

packer() {
  echo "Preparing Packer setup"
  "/bin/nvim" --headless \
    -c 'autocmd User PackerComplete quitall' \
    -c 'PackerSync'
  echo "Packer setup complete"
}

install_deps
copy_old_config
clone_repo
clone_packer
packer
