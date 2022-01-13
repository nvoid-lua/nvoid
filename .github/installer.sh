#!/bin/env bash

if [ -d "$HOME/.config/nvim/" ]; 
then 
  mv ~/.config/nvim/ ~/.config/NV_BC
fi

if [ -d "$HOME/.local/share/nvim/" ]; 
then 
  mv ~/.local/share/nvim/ ~/.local/share/NV_BC
fi

warnnvim() {
  echo "Please install neovim"
  exit
}

warnnode() {
  echo "Please install node"
  exit
}

warnpip() {
  echo "Please install pip"
  exit
}

warngit() {
  echo "Please install git"
  exit
}

which nvim >/dev/null && echo "Neovim is installed" || warnnvim
which git >/dev/null && echo "Git is installed" || warngit
which node >/dev/null && echo "Node is installed" || warnnode
which pip >/dev/null && echo "Node is installed" || warnpip

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone https://github.com/ysfgrgO7/nvoid.git ~/.config/nvim

npm install -g -f fd-find
npm install -g -f neovim
npm install -g -h tree-sitter-cli
python3 -m pip install --user pynvim

nvim -c 'PackerSync'
