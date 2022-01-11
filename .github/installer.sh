#!/bin/env bash

function msg() {
  local text="$1"
  local div_width="80"
  printf "%${div_width}s\n" ' ' | tr ' ' -
  printf "%s\n" "$text"
}

function install_deps() {
  if command -v pacman &> /dev/null
  then
	  sudo pacman -S --noconfirm --needed nodejs xclip fd ripgrep
  elif command -v xbps-install &> /dev/null
  then
  	  sudo xbps-install -Syu nodejs fd xclip ripgrep
  fi
}

msg "Would you like to install some dependencies?"
read -p "[y]es or [n]o (default: no) : " -r answer
[ "$answer" != "${answer#[Yy]}" ] && install_deps

if [ -d "$HOME/.config/nvim/" ]; 
then 
  mv ~/.config/nvim/ ~/.config/NV_BC
fi

if [ -d "$HOME/.local/share/nvim/" ]; 
then 
  mv ~/.local/share/nvim/ ~/.local/share/NV_BC
fi

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone https://github.com/ysfgrgO7/nvoid.git ~/.config/nvim
# cd ~/.config/nvim/lua/
# mkdir ~/.config/nvim/lua/custom/
# cd ~/.config/nvim/lua/custom
# cp -r ~/.config/nvim/example/example_nvoidrc.lua ~/.config/nvim/lua/custom/nvoidrc.lua
nvim -c 'PackerSync'
# nvim -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
# nvim
