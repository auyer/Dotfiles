# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

export TERMINAL="gnome-terminal"
export GOROOT=/usr/local/go
export GOPATH=$HOME/golangws
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export proxy="http://10.30.0.10:3128"
alias go='http_proxy=$proxy go'
alias pip='pip --proxy="http://10.30.0.10:3128" '
alias pip3='pip3 --proxy="http://10.30.0.10:3128" '
alias mix='HTTP_PROXY=$proxy mix'
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
