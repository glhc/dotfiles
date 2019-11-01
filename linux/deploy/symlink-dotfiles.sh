#!/bin/bash

######## Building section for symlinks

# tmux config symlink
ln -sf $(realpath ../tmux/.tmux.conf) ~/.tmux.conf


# .bashrc symlink
ln -sf $(realpath ../bash/.bashrc) ~/.bashrc

# .inputrc symlink
ln -sf $(realpath ../bash/.inputrc) ~/.inputrc

# Set up push to ~/.config/neovim
if [ ! -d ~/.config/nvim ]
then
  echo "Creating ~/.config/nvim"
  mkdir -p ~/.config/nvim
fi

  # Neovim config symlink
  ln -sf $(realpath ../../universal/neovim/init.vim) ~/.config/nvim/init.vim

  # coc-settings.json symlink
  ln -sf $(realpath ../../universal/neovim/coc-settings.json) ~/.config/nvim/coc-settings.json

