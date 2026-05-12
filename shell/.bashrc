#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTFILE=~/.histfile
HISTSIZE=20000
SAVEHIST=20000

# source ~/.profile
source ~/.private

# Starship 
if [ -x "$(command -v starship)" ]; then
  eval "$(starship init bash)"
fi

