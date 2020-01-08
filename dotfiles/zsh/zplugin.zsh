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
# Search/AutoCompletion
##
zplugin ice silent wait"0" blockf
zplugin light "zsh-users/zsh-completions"

zplugin ice silent wait"0" pick"you-should-use.plugin.zsh"
zplugin load "MichaelAquilina/zsh-you-should-use"

zplugin ice silent wait"0" pick"autopair.zsh"
zplugin load "hlissner/zsh-autopair"

zplugin ice silent wait"0" atload"_zsh_autosuggest_start"
zplugin light "zsh-users/zsh-autosuggestions"

zplugin ice silent wait"0" pick"shell/*.zsh"
zplugin load "lotabout/skim"

# zplugin ice silent wait"0"
# zplugin snippet "OMZ::plugins/fzf/fzf.plugin.zsh"

##
# Docker
##
zplugin ice as"completion"
zplugin snippet "OMZ::plugins/docker/_docker"

zplugin ice silent as"completion" wait"0" pick"docker-compose.plugin.zsh"
zplugin snippet "OMZ::plugins/docker-compose/docker-compose.plugin.zsh"

##
# Kubernetes
##
zplugin snippet "OMZ::plugins/minikube/minikube.plugin.zsh"

source <(kubectl completion zsh)

##
# ls
##
zplugin ice atclone"dircolors -b LS_COLORS > ls_colors.zsh" atpull"%atclone" pick"ls_colors.zsh"
zplugin light trapd00r/LS_COLORS

##
# Syntax Higlighting
##
zplugin ice silent wait"0" atinit"zpcompinit; zpcdreplay"
zplugin load zdharma/fast-syntax-highlighting

##
# Direnv
##
zplugin ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' pick"direnv" src"zhook.zsh"
zplugin light direnv/direnv
