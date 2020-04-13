
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Aliases
alias ls="ls -lhA --color"
alias grep='grep --color=auto'
alias dcr='docker-compose run'


# Colourise manpages
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;43m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# Colourise 'less' command
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
# and so on

# Custom grep color
export GREP_COLOR="35"

# Customise bash prompt
export PS1="\u:\w \\$ \[$(tput sgr0)\]"

# Start tmux on every shell login.
if [[ $DISPLAY ]]; then
    # If not running interactively, do not do anything
    [[ $- != *i* ]] && return
    # Start tmux server
    [[ -z "$TMUX" ]] && exec tmux

  # look for unattached sessions and attach to them, or else start a new session
  if [[ -z "$TMUX" ]] ;then
      ID="$( tmux ls | grep -vm1 attached | cut -d: -f1 )" # get the id of a deattached session
      if [[ -z "$ID" ]] ;then # if not available create a new one
          MAIN="$( tmux ls |grep main )"
          echo "MAIN set. MAIN value:"
          echo $MAIN
          if [[ -z "$MAIN" ]] ;then
            # if there's no main session, make one and name it main
            tmux new-session -A -s main
          else
            # if there's already a main session, make a new unnamed session
            tmux new-session -s uhoh
          fi
      else
          tmux attach-session -t "$ID" # if available attach to it
      fi
  fi
fi

# testing tmux preset windows on startup, leaving this here while WIP
# tmux new-session -A -s main

# if dircolors exists, use them
# if [ -f ~/.dir_colors ]
# then
eval `dircolors ~/.dir_colors`
# fi

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

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

eval "$(direnv hook bash)"
