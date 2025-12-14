#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTFILE=~/.histfile
HISTSIZE=20000
SAVEHIST=20000

source ~/.profile
source ~/.private

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
	SESSION_TYPE=remote/ssh
	echo Welcome from $SSH_CLIENT
fi

# brew ------------------------------
if [[ -e /home/linuxbrew/.linuxbrew/bin/brew ]]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if [[ ! -e ~/.local/share/fonts/HasklugNerdFont-Medium.otf ]]; then
	mkdir -p ~/.local/share/fonts/
	cd ~/.local/share/fonts/
	wget -qO- https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hasklig.tar.xz | tar -xJf -
fi

#------------------------------
# Alias stuff
#------------------------------
alias ls="ls --color -F"
alias ll="ls --color -lh"
alias spm="sudo pacman"
alias awssso="aws sso login --no-browser"
alias cp="cp -i"     # Confirm before overwriting something
alias df='df -h'     # Human-readable sizes
alias free='free -m' # Show sizes in MB

# alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

#------------------------------
# Variables
#------------------------------
export BROWSER="firefox"
export EDITOR="nvim"
export VISUAL=nvim
export GOPATH="$HOME/go"

export PATH=$PATH:/home/auyer/go/bin:/home/auyer/work/bin
export PATH="$PATH:${HOME}/.local/bin"

# kw
source /home/auyer/.local/lib/kw/bash_autocomplete.sh
source /home/auyer/.config/kw/kw_prompt_current_env_name.sh

eval "$(starship init bash)"
