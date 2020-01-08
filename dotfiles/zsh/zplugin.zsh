##
# Always Clear Screen & Run `ls`
##
AUTO_LS_COMMANDS=(exa git-status)

zplugin ice silent wait"0" pick"auto-ls.zsh"
zplugin load "desyncr/auto-ls"

auto-ls-exa () {
  exa
  [[ $AUTO_LS_NEWLINE != false ]] && echo ""
}

zplugin ice silent wait"0" pick"almostontop.plugin.zsh"
zplugin load "Valiev/almostontop"

##
# Nice Things
zplugin ice silent wait"0" pick"you-should-use.plugin.zsh"
zplugin load "MichaelAquilina/zsh-you-should-use"

zplugin ice silent wait"0" pick"autopair.zsh"
zplugin load "hlissner/zsh-autopair"

zplugin ice silent wait"0" pick"shell/*.zsh"
zplugin load "lotabout/skim"

zplugin ice as"completion"
zplugin snippet "OMZ::plugins/docker/_docker"

zplugin ice silent as"completion" wait"0" pick"docker-compose.plugin.zsh"
zplugin snippet "OMZ::plugins/docker-compose/docker-compose.plugin.zsh"

zplugin snippet "OMZ::plugins/minikube/minikube.plugin.zsh"

source <(kubectl completion zsh)

zplugin ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' pick"direnv" src"zhook.zsh"
zplugin light direnv/direnv

# zplugin ice wait blockf atpull'zplugin creinstall -q .'
# zplugin light zsh-users/zsh-completions

zplugin ice wait atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

zplugin ice wait atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions
