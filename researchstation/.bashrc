# .bashrc
export GOROOT=/usr/lib/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin
export TERM=xterm-256color
# Powerline-go
function _update_ps1() {
    PS1="$(~/go/bin/powerline-go -error $?)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# Source global definitions
export TERMINAL="termite"
