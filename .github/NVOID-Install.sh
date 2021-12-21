#!/bin/env bash

if command -v pacman &> /dev/null
then
	sudo pacman -S --noconfirm --needed npm python-pip xclip neovim base-devel ripgrep fzf
elif command -v xbps-install &> /dev/null
then
	sudo xbps-install -Syu nodejs python3-pip python-pip fd xclip neovim base-devel ripgrep fzf
elif command -v apt-get &> /dev/null
    curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
    sudo dpkg -i ripgrep_13.0.0_amd64.deb
    curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
    sudo apt-get install -y nodejssudo apt-get install fd-find
fi
git clone https://github.com/ysfgrgO7/nvoid.git ~/.config/nvim
mv ~/.config/nvim ~/.config/NV.bc
mkdir -p ~/.local/share/nvim/
sudo npm i -g neovim
pip install pynvim
nvim -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
nvim
