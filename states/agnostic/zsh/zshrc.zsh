# I'm not sure why I need this at the moment, but vi-mode has taken over!
bindkey -e

source ~/.zsh/kubectl.zsh
source ~/.zsh/gcloud.zsh
source ~/.zsh/paths.zsh
source ~/.zsh/common.zsh
source ~/.zsh/docker.zsh
source ~/.zsh/keybindings.zsh
source ~/.zsh/history.zsh

source ~/.zplug/init.zsh
source ~/.zsh/zplug.zsh

source ~/.zsh/powerlevel9k.zsh

# fzf Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load local overrides last
if [[ -f ~/.zshrc.local ]];
then
    source ~/.zshrc.local
fi
