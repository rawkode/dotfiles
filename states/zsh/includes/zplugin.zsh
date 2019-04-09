##
# Powerlevel9k
##
zplugin ice from"gh"
zplugin load bhilburn/powerlevel9k

##
# Always Clear Screen & Run `ls`
##
zplugin ice from"gh"
zplugin load 'desyncr/auto-ls'
zplugin load "Valiev/almostontop"

##
# Docker
##
zplugin ice as"completion"
zplugin snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker
zplugin snippet https://github.com/docker/compose/blob/master/contrib/completion/zsh/_docker-compose

zplugin ice wait"0" lucid
zplugin snippet OMZ::plugins/docker/_docker
zplugin snippet OMZ::plugins/docker-compose/docker-compose.plugin.zsh

##
# Kubernetes
##
zplugin ice wait"0" lucid
zplugin snippet OMZ::plugins/kubectl/kubectl.plugin.zsh

##
# ZINC Theme
#
# zinc has no need for completion symlinking
##
#zplugin ice nocompletions
#zplugin load robobenklein/zinc

##
# Search/AutoCompletion
##
zplugin ice wait"0" blockf
zplugin light zsh-users/zsh-completions

zplugin ice wait"0" atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions

zplugin ice wait"0" atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting
