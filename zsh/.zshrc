# ZSH CONFIG 
#
source ~/.zsh_prompt_config

#------------------------------
# Alias stuff
#------------------------------
alias ls="ls --color -F"
alias ll="ls --color -lh"
alias spm="sudo pacman"
alias gr="gvim --remote-silent"
alias vr="vim --remote-silent"
alias awssso="aws sso login --no-browser"

#------------------------------
# Variables
#------------------------------
export BROWSER="firefox"
export EDITOR="nvim"
export VISUAL=nvim
export GOPATH="$HOME/go"

source $HOME/.cargo/env

export PATH=$PATH:/home/auyer/go/bin:/home/auyer/work/bin
export PATH="$PATH:${HOME}/.local/bin"

source /usr/share/nvm/init-nvm.sh
#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

[[ $commands[kubectl] ]] && source <(kubectl completion zsh)


eval "$(starship init zsh)"


#------------------------------
source ~/.profile

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  SESSION_TYPE=remote/ssh
  echo Welcome from $SSH_CLIENT
fi
