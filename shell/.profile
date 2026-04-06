if [ -n "${CONTAINER_ID+set}" ]; then
	# echo "In container, preparing devbox and Nix"
	if [[ ! -e /usr/local/bin/devbox ]]; then
		curl -fsSL https://get.jetify.com/devbox | bash
	fi
	if [[ -e /home/auyer/.nix-profile/etc/profile.d/nix.sh ]]; then
		source /home/auyer/.nix-profile/etc/profile.d/nix.sh
	fi

	eval "$(devbox global shellenv --init-hook)"

	if ! [ -x "$(command -v rg)" ]; then
		devbox global add ripgrep awscli2 fzf
	fi

	if ! [ -x "$(command -v starship)" ]; then
		devbox global add starship
	fi

	refresh-global
fi

export PATH=$PATH:/home/auyer/go/bin:/home/auyer/work/bin
export PATH="$PATH:${HOME}/.local/bin"
export PATH="$PATH:${HOME}/bin"

eval "$(devbox global shellenv --init-hook)"

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
#=======

. "$HOME/.cargo/env"
