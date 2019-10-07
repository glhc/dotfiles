# .bashrc

# User specific aliases and functions

bind "\e[1;5D":backward-word
bind "\e[1;5D":forward-word
bind "TAB":menu-complete
bind "^[[Z":menu-complete-backward

# Run solarized dircolors db
if [ -f ~/.dir_colors/dircolors ]
    then eval `dircolors ~/.dir_colors/dircolors`
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Aliases
alias ls="ls -lhA --color"

#Set readline vi mode
set -o vi
