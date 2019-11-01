# dotfiles

Contains config files so I don't have to keep creating them over and over

## Requirements

- i3wm
- tmux
- bash
- [ddcutil](https://www.ddcutil.com/) (monitor settings control utility)
- neovim


## To Implement:

### Linux Terminal

The terminal theming needs the following:

- Consolas font (from PowerShell). I prefer it to Unix fonts.

#### Consistent theming

Trying to develop the XResources file provided in altercation/solarized to be
a portable and consistent experience in an Xorg server environment.  
This will have the benefit of being transmitted over ssh.

Also, I would like to understand the ins-and-outs of terminal colour support.

### PowerShell

Neovim is currently running vim-plug ```:PlugInstall``` all the time.  
I need to find out why.
