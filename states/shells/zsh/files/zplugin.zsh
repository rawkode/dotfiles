# Add 256color if terminal the current terminal supports it.
zplugin load "chrissicool/zsh-256color"

##
# Base16
##
zplugin ice pick"async.sh" src"scripts/base16-dracula.sh"
zplugin load "chriskempson/base16-shell"

##
# Powerlevel10k
##
zplugin ice depth=1; zplugin light romkatv/powerlevel10k

##
# Always Clear Screen & Run `ls`
##
zplugin ice silent wait"0" pick"auto-ls.zsh"
zplugin load "desyncr/auto-ls"

zplugin ice silent wait"0" pick"almostontop.plugin.zsh" ver="ad80d3a0c9bb7d0a26dd786c7a60ea0298ae31b0"
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

##
# History Plugins
##
# History
zplugin ice wait"0"
zplugin snippet OMZ::plugins/history/history.plugin.zsh
zplugin ice wait"0"
zplugin snippet OMZ::plugins/per-directory-history/per-directory-history.zsh
zplugin ice wait"0"
zplugin light zdharma/history-search-multi-word
zplugin ice silent wait"0" pick"zsh-history-substring-search.zsh"
zplugin load "zsh-users/zsh-history-substring-search"

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
