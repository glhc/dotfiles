#.bashrc

# User specific aliases and functions

bind "\eOD":backward-word
bind "\eOC":forward-word
bind 'TAB':menu-complete

# Run solarized dircolors db
if [ -f ~/.dir_colors/dircolors ]
    then eval `dircolors ~/.dir_colors/dircolors`
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Aliases
alias ls="ls -lhA --color"

