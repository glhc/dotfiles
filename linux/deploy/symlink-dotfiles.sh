#!/bin/bash


if [ -f /some/dir/not/there ]
then
  echo "found dir"
else
  echo "dir not found"
fi

######## Building section for symlinks

# tmux config symlink
ln -sf ../.tmux.conf ~/.tmux.conf


# .bashrc symlink
ln -sf ../.bashrc ~/.bashrc

# .inputrc symlink

## Building section for pathchecks
# Set up push to ~/.config/neovim
if [ ! -d ~/.config/nvim ]
then
  mkdir -p ~/.config/nvim

  # Neovim config symlink
  ln -sf ../init.vim ~/.config/nvim/init.vim

  # coc-settings.json symlink
  ln -sf ../coc-settings.json ~/.config/nvim/coc-settings.json
fi


