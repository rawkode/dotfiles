_has() {
    which $1>/dev/null 2>&1
}

##
# zplugin
##
source ~/.zplugin/bin/zplugin.zsh

##
# Customisations
##
for file in ~/.zsh/includes/*; do
    source "$file"
done

source ~/.zsh/zplugin.zsh
