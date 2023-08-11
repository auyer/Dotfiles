
# The following lines were added by compinstall

zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/auyer/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt autocd extendedglob
# End of lines configured by zsh-newuser-install

export EDITOR=vim
export VISUAL=vim

source $HOME/.cargo/env

export PATH=$PATH:/home/auyer/go/bin:/home/auyer/work/bin
export PATH="$PATH:${HOME}/.local/bin"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"


eval "$(starship init zsh)"

source ~/.profile
