#!/bin/bash

######## Building section for symlinks

# alacritty config symlink
if [ ! -d ~/.config/alacritty ]
then
  mkdir -p ~/.config/alacritty
fi
ln -sf $(realpath ../../src/universal/alacritty/alacritty.yml) ~/.config/alacritty/alacritty.yml

# tmux config symlink
ln -sf $(realpath ../../src/linux/tmux/.tmux.conf) ~/.tmux.conf

# .bashrc symlink
ln -sf $(realpath ../../src/linux/bash/.bashrc) ~/.bashrc

# .bash_profile symlink
ln -sf $(realpath ../../src/linux/bash/.bash_profile) ~/.bash_profile

# .inputrc symlink
ln -sf $(realpath ../../src/linux/bash/.inputrc) ~/.inputrc

# Neovim config symlink
if [ ! -d ~/.config/nvim ]
then
  mkdir -p ~/.config/nvim
fi

ln -sf $(realpath ../../src/universal/neovim/init.vim) ~/.config/nvim/init.vim

# coc-settings.json symlink
ln -sf $(realpath ../../src/universal/neovim/coc-settings.json) ~/.config/nvim/coc-settings.json

# symlink dircolors-solarized to ~/.dircolors
ln -sf $(realpath ../../src/linux/bash/dircolors-solarized.ansi-dark) ~/.dir_colors

# symlink git config
ln -sf $(realpath ../../src/universal/git/.gitconfig) ~/.gitconfig

# symlink rubocop config
if [ ! -d ~/.config/rubocop ]
then
  mkdir -p ~/.config/rubocop
fi

ln -sf $(realpath ../../src/universal/neovim/syntax/ruby/.rubocop.yml) ~/.config/rubocop/config.yml

# symlink i3 config
if [ ! -d ~/.config/i3 ]
then
  mkdir -p ~/.config/i3
fi
ln -sf $(realpath ../../src/linux/i3/config) ~/.config/i3/config

# compton.conf
ln -sf $(realpath ../../src/linux/compton/.compton.conf) ~/.config/compton.conf

# symlink scripts
if [ ! -d ~/code ]
then
  mkdir -p ~/code
fi

ln -s $(realpath ../../scripts/) ~/code/scripts
