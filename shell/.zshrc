# for profiling
# zmodload zsh/zprof
#------------------------------
# source ~/.profile
source ~/.private

#
# ZSH CONFIG
#
source ~/.zsh_prompt_config


# zinit ------------------------------
# echo "sourcing zinit"
source ~/.zinitrc


# kw
export fpath=(/home/auyer/.local/lib/kw $fpath)


# zprof
autoload compinit && compinit -i

# Starship 
if [ -x "$(command -v starship)" ]; then
  eval "$(starship init zsh)"
fi

