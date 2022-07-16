#!/bin/env bash

### Update repo
update_repo() {
  cd ~/.config/nvim/ && git pull
}

update_plugins() {
  nvim -c ":PackerSync"
}

update_repo
update_plugins
