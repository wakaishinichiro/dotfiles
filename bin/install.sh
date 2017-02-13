#!/bin/bash

# install dotfiles
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.zshrc ~/.zshrc

# zsh zaw
if [ -d "~/zsh_plugins" ]; then
  mkdir ~/zsh_plugins
  git clone git://github.com/zsh-users/zaw.git ~/zsh_plugins/zaw
fi

# zsh compinit
chmod 755 /usr/local/share/zsh
chmod 755 /usr/local/share/

