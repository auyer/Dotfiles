#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTFILE=~/.histfile
HISTSIZE=20000
SAVEHIST=20000

source ~/.profile

# Starship 
if [ -x "$(command -v starship)" ]; then
  eval "$(starship init bash)"
fi


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi 



eval "$(direnv hook bash)"
