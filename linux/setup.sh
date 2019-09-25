#!/bin/bash

# Make an nvim directory for init.vim
mkdir -p ~/.config/nvim || echo "Neovim config path already exists."

# Copy neovim's dotfile to required directory.
cp ./init.vim ~/.config/nvim/init.vim || echo "Copy of ./init.vim to ~/.config/nvim/init.vim failed."

# tmux
cp .tmux.conf ~/.tmux.conf
