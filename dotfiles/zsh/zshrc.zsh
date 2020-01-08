##
# AutoComplete
autoload -Uz compinit
compinit

##
#
_has() {
    which $1>/dev/null 2>&1
}

##
# GOPATH is special, we need it even if we don't write Go
# because all my other development functions / aliases use it
# for the CODE_DIR
GOPATH=${HOME}/Code

##
# Paths
#
# In zsh, the $PATH variable is tied to the $path variable.
# This makes the $path variable act like a set.
typeset -U path

##
# zplugin
##
source ${HOME}/.zplugin/bin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

##
# My zsh configurations
for file in ~/.zsh/includes/*; do
    source "$file"
done

##
# Load zplugins plugins that haven't been put into files above (yet)
source ~/.zsh/zplugin.zsh

##
# Using the (N-/) glob qualifier we can remove paths that do not exist.
path=($^path(N-/))

##
#
zpcompinit
