source ~/.zsh/aliases.zsh
source ~/.zsh/common.zsh
source ~/.zsh/history.zsh
source ~/.zsh/kubesec.zsh
source ~/.zsh/paths.zsh

##
# zplug
##
# source ~/.zplug/init.zsh
# source ~/.zsh/zplug.zsh

##
# zplugin
##
source ~/.zplugin/bin/zplugin.zsh
source ~/.zsh/zplugin.zsh

##
# Powerlevel9k
##
source ~/.zsh/powerlevel9k.zsh

# fzf Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load local overrides last
#if [[ -f ~/.zshrc.local ]];
#then
#    source ~/.zshrc.local
#fi
