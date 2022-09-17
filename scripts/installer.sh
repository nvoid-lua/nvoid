#!/bin/bash

## Checking neovim
pkg_nvim_installed() {
  # if it's not install install it
  read -p "Neovim is not installed! would you like to install it? (default no)  " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
  if command -v pacman &> /dev/null
  then
    sudo pacman -Syu --needed neovim
  elif command -v xbps-install &> /dev/null
  then
    sudo xbps-install -Syu neovim
  elif command -v apt-get &> /dev/null
  then
    echo "Visit: https://github.com/neovim/neovim/wiki/Installing-Neovim#appimage-universal-linux-package" 
    exit 0
  elif command -v dnf &> /dev/null
  then
   sudo dnf install neovim
  fi
  else
  if command -v pacman &> /dev/null
  then
    echo "### Neovim is not installed try:"
    echo "sudo pacman -Syu --needed neovim"
  elif command -v xbps-install &> /dev/null
  then
    echo "sudo xbps-install -Syu neovim"
  elif command -v apt-get &> /dev/null
  then
    echo "### Neovim is not installed try:"
    echo "Visit: https://github.com/neovim/neovim/wiki/Installing-Neovim#appimage-universal-linux-package"
  elif command -v dnf &> /dev/null
  then
   echo "### Neovim is not installed try:"
   echo "sudo dnf install neovim"
  fi
  fi
}
warnnvim() {
  echo $(pkg_nvim_installed)
  exit
}
function check_neovim_min_version() {
  local verify_version_cmd='if !has("nvim-0.7.0") | cquit | else | quit | endif'
  if ! nvim --headless -u NONE -c "$verify_version_cmd"; then
    echo "[ERROR]: Nvoid requires at least Neovim v0.7.0 or higher"
    warnnvim
    exit 1
  fi
}

which nvim >/dev/null && echo "Neovim 0.7.0 is installed" || warnnvim

## Checking git
pkg_git_installed() {
  if command -v pacman &> /dev/null
  then
    echo "sudo pacman -Syu --needed git"
  elif command -v xbps-install &> /dev/null
  then
    echo "sudo xbps-install -Syu git"
  elif command -v apt-get &> /dev/null
  then
    echo "sudo apt install git" 
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
### npm deps START
  function install_nodejs_deps() {
    pkg_nodejs_install() {
      if command -v pacman &> /dev/null
      then
        echo "sudo pacman -Syu --needed nodejs npm"
      elif command -v xbps-install &> /dev/null
      then
        echo "sudo xbps-install -Syu nodejs"
      elif command -v apt-get &> /dev/null
      then
        echo "sudo apt install -y nodejs npm" 
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
    which node npm >/dev/null && echo "Node and npm are installed" || warnnode
    declare -a __npm_deps=(
      "neovim"
      "tree-sitter-cli"
    )
    for deps in "${__npm_deps[@]}"; do
      sudo npm i -g "$deps" --force
    done
  }

  read -p "Do you want to install Node dependencies for Nvoid? (default no)  " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    install_nodejs_deps
  fi
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
      elif command -v apt-get &> /dev/null
      then
        echo "sudo apt install -y python3 python3-pip" 
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
    which pip >/dev/null && echo "pip is installed" || warnpip
    declare -a __pip_deps=(
      "pynvim"
    )
    for deps in "${__pip_deps[@]}"; do
      pip install --force-reinstall "$deps"
    done
  }

  read -p "Do you want to install Python dependencies for Nvoid? (default no)  " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    install_pip_deps
  fi
### pip deps END

### Cargo dep START
  function install_cargo_deps() {
    pkg_cargo_install() {
      if command -v pacman &> /dev/null
      then
        echo "sudo pacman -Syu --needed rust cargo"
      elif command -v xbps-install &> /dev/null
      then
        echo "sudo xbps-install -Syu rust cargo"
      elif command -v apt-get &> /dev/null
      then
        echo "sudo apt install -y cargo" 
      elif command -v dnf &> /dev/null
      then
       echo "sudo dnf install cargo rust"
      fi
    }
    warncargo() {
      echo "### cargo is not installed try:"
      echo $(pkg_cargo_install)
      exit
    }
    which cargo >/dev/null && echo "Cargo is installed" || warncargo
    declare -a __cargo_deps=(
       "stylua"
       "fd-find"
    )
    for deps in "${__cargo_deps[@]}"; do
      cargo install "$deps"
    done
  }
  read -p "Do you want to install Rust dependencies for Nvoid? (default no)  " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    install_cargo_deps
    sudo cp -r ~/.cargo/bin/fd /bin/
    sudo cp -r ~/.cargo/bin/stylua /bin/
  fi
### Cargo dep END
}

clone_repo() {
  git clone https://github.com/nvoid-lua/nvoid.git ~/.config/nvim
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
    nvim --headless +'autocmd User PackerComplete sleep 100m | qall' +PackerInstall
    nvim --headless +'autocmd User PackerComplete sleep 10m | qall' +PackerSync
}

if [ "$1" == "-h" ] ; then
  # help
  echo "Welcome to the NVoid Installer!"
  echo "options:"
  echo "    -y: Install Nvoid with all the dependencies needed"
  echo "    -n: Install Nvoid without any user choice"
  exit 0
elif [ "$1" == "-y" ]; then
 # Yes to all opts
  echo "Hello, $(whoami)!"
  check_neovim_min_version
 # Npm
  nodey() {
    echo "### nodejs or npm are not installed"
    echo "skipping..."
  }
  which node npm >/dev/null && echo "Node and npm are installed" || nodey
  sudo npm i -g neovim --force
  sudo npm i -g tree-sitter-cli --force
 # python
  pythony() {
    echo "### pip is not installed"
    echo "skipping..."
  }
  which node npm >/dev/null && echo "pip is installed" || pythony
  pip install --force-reinstall pynvim
 # Cargo
  cargoy() {
    echo "### cargo is not installed"
    echo "skipping..."
  }
  which node npm >/dev/null && echo "cargo is installed" || cargoy
  cargo install stylua fd-find
  cargo install stylua stylua
  sudo cp -r ~/.cargo/bin/fd /bin/
  sudo cp -r ~/.cargo/bin/stylua /bin/
  copy_old_config
  clone_repo
  clone_packer
  echo "Preparing Packer setup"
  packer
  echo -e "\nCompile Complete"
  nvim
elif [ "$1" == "-n" ]; then
 # No to all opts
  echo "Hello, $(whoami)!"
  check_neovim_min_version
  copy_old_config
  clone_repo
  clone_packer
  echo "Preparing Packer setup"
  packer
  echo -e "\nCompile Complete"
  nvim
else
 # Normal
  echo "Hello, $(whoami)!"
  check_neovim_min_version
  install_deps
  copy_old_config
  clone_repo
  clone_packer
  echo "Preparing Packer setup"
  packer
  echo -e "\nCompile Complete"
  nvim
fi
