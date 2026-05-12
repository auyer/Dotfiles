if [[ ! -e /usr/local/bin/devbox ]]; then
    curl -fsSL https://get.jetify.com/devbox | bash
fi

if [ -n "${CONTAINER_ID+set}" ]; then
    # echo "In container, preparing devbox and Nix"
    eval "$(devbox global shellenv --init-hook)"

    # if ! [ -x "$(command -v rg)" ]; then
    #     devbox global add ripgrep awscli2 fzf
    # fi

    if ! [ -x "$(command -v starship)" ]; then
        devbox global add starship
    fi

    refresh-global
fi

# brew ------------------------------
if [[ -e /home/linuxbrew/.linuxbrew/bin/brew ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

export PATH=$PATH:/home/auyer/go/bin:/home/auyer/work/bin
export PATH="$PATH:${HOME}/.local/bin"
export PATH="$PATH:${HOME}/bin"

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
alias g='git'
alias gi='git'
alias lz='lazygit'

alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"
. /usr/share/bash-completion/completions/quilt
complete -F _quilt_completion -o filenames dquilt

#=======

#------------------------------
# Variables
#------------------------------
export BROWSER="firefox"
export EDITOR="nvim"
export VISUAL=nvim
export GOPATH="$HOME/go"


# RUSTUP
. "$HOME/.cargo/env"

# kw
source /home/auyer/.local/lib/kw/bash_autocomplete.sh
source /home/auyer/.config/kw/kw_prompt_current_env_name.sh

export PATH="$PATH:${HOME}/.local/bin"

# agentbox completion
source "${HOME}/.local/bin/agentbox/agentbox.completion"
export PATH="$PATH:/home/auyer/.local/bin"
# export PATH="${HOME}/.local/bin/agentbox:${PATH}"
# agentbox end

eval "$(devbox global shellenv)"
