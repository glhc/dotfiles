
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Aliases
alias ls="ls -lhA --color"


# Start tmux on every shell login.
if [[ $DISPLAY ]]; then
    # If not running interactively, do not do anything
    [[ $- != *i* ]] && return
    [[ -z "$TMUX" ]] && exec tmux
fi

if which tmux >/dev/null 2>&1; then
    # if no session is started, start a new session
    test -z ${TMUX} && tmux

    # when quitting tmux, try to attach
    while test -z ${TMUX}; do
        tmux attach || break
    done
fi

# If ~/.config doesn't exist, make it
# if [ -d ~/.config/theme/dircolors-solarized ]
# then
#   eval `~/.config/theme/dircolors-solarized/dircolors.ansi-dark`
# fi
  

# if dircolors exists, use them
if [ -f ~/.dir_colors ]
then
  eval `dircolors ~/.dir_colors`
fi

# If rbenv is installed
if [ -d ~/.rbenv ]
then
  # add rbenv to PATH variable
  export PATH="$HOME/.rbenv/bin:$PATH"
  # Load rbenv automatically
  eval "$(rbenv init -)" 
fi

# Specify vim as default editor for programs
export VISUAL=nvim
export EDITOR="$VISUAL"
