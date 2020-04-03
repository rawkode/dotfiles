##
# Always Clear Screen & Run `ls`
##
AUTO_LS_COMMANDS=(exa git-status)

zinit ice lucid pick"auto-ls.zsh"
zinit load "desyncr/auto-ls"

auto-ls-exa () {
  exa
  [[ $AUTO_LS_NEWLINE != false ]] && echo ""
}

# zinit ice lucid pick"almostontop.plugin.zsh"
# zinit load "Valiev/almostontop"

##
# Nice Things
zinit ice silent wait"0" pick"autopair.zsh"
zinit load "hlissner/zsh-autopair"

zinit ice silent wait"0" pick"shell/*.zsh"
zinit load "lotabout/skim"

zinit ice as"completion"
zinit snippet "OMZ::plugins/docker/_docker"

zinit ice silent as"completion" wait"0" pick"docker-compose.plugin.zsh"
zinit snippet "OMZ::plugins/docker-compose/docker-compose.plugin.zsh"

zinit snippet "OMZ::plugins/minikube/minikube.plugin.zsh"

source <(kubectl completion zsh)

zinit ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' pick"direnv" src"zhook.zsh"
zinit light direnv/direnv

# zinit ice wait blockf atpull'zinit creinstall -q .'
# zinit light zsh-users/zsh-completions

zinit ice wait lucid atinit"zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

zinit ice wait lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions
