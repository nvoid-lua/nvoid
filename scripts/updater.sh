#!/bin/env bash

### Update Repo
update_repo() {
  cd ~/.config/nvim/ && git pull
}

### Update Plugins
update_plugins() {
  echo "Updating Plugins" && "/bin/nvim" --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
  echo "Update completed"
}

### Running
update_repo
update_plugins
echo "#### Please close the terminal and restart nvoid ####"
$SHELL
