#!/bin/bash

######## Building section for symlinks

# tmux config symlink
ln -sf $(realpath ../../src/linux/tmux/.tmux.conf) ~/.tmux.conf


# .bashrc symlink
ln -sf $(realpath ../../src/linux/bash/.bashrc) ~/.bashrc

# .bash_profile symlink
ln -sf $(realpath ../../src/linux/bash/.bash_profile) ~/.bash_profile

# .inputrc symlink
ln -sf $(realpath ../../src/linux/bash/.inputrc) ~/.inputrc

# Set up push to ~/.config/neovim
if [ ! -d ~/.config/nvim ]
then
  mkdir -p ~/.config/nvim
fi

# Neovim config symlink
ln -sf $(realpath ../../src/universal/neovim/init.vim) ~/.config/nvim/init.vim

# coc-settings.json symlink
ln -sf $(realpath ../../src/universal/neovim/coc-settings.json) ~/.config/nvim/coc-settings.json

# symlink dircolors-solarized to ~/.dircolors
ln -sf $(realpath ../../src/linux/bash/dircolors-solarized.ansi-dark) ~/.dir_colors

# symlink git config
ln -sf $(realpath ../../src/universal/git/.gitconfig) ~/.gitconfig
