_has() {
    which $1>/dev/null 2>&1
}

##
# Customisations
##
for file in ~/.zsh/includes/*; do
    source "$file"
done

##
# zplugin
##
source ~/.zplugin/bin/zplugin.zsh
source ~/.zsh/zplugin.zsh

eval "$(starship init zsh)"
