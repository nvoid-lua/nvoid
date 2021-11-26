#!/bin/env bash

if command -v pacman &> /dev/null
then
	sudo pacman -S --noconfirm --needed npm ranger python-pip xclip neovim base-devel lazygit ncdu ripgrep fzf
elif command -v xbps-install &> /dev/null
then
	sudo xbps-install -Syu nodejs ranger python3-pip python-pip fd xclip neovim lazygit base-devel ncdu ripgrep fzf
fi
mv ~/.config/nvim ~/.config/NV.bc
mkdir -p ~/.local/share/nvim/
sudo npm i -g neovim
pip install pynvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone https://github.com/ysfgrgO7/nvoid.git ~/.config/nvim
nvim -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
nvim
