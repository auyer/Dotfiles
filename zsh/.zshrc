#------------------------------
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

# if [[ ! -e ~/.local/share/fonts/JetBrainsMonoNerdFont-Medium.ttf ]]; then
#   mkdir -p ~/.local/share/fonts/
#   cd ~/.local/share/fonts/
#   wget -qO- https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz | tar -xJf -
# fi

# zinit ------------------------------
source ~/.zinitrc
#
# ZSH CONFIG 
#
source ~/.zsh_prompt_config

#------------------------------
# Alias stuff
#------------------------------
alias ls="ls --color -F"
alias ll="ls --color -lh"
alias spm="sudo pacman"
alias awssso="aws sso login --no-browser"
alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
# alias gr="gvim --remote-silent"
# alias vr="vim --remote-silent"


#------------------------------
# Variables
#------------------------------
export BROWSER="firefox"
export EDITOR="nvim"
export VISUAL=nvim
export GOPATH="$HOME/go"

export PATH=$PATH:/home/auyer/go/bin:/home/auyer/work/bin
export PATH="$PATH:${HOME}/.local/bin"

# source /usr/share/nvm/init-nvm.sh
#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


[[ $commands[kubectl] ]] && source <(kubectl completion zsh)


eval "$(starship init zsh)"

# kw
export fpath=(/home/auyer/.local/lib/kw $fpath)
# autoload compinit && compinit -i

