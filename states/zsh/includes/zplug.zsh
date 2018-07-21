# Favourites
# bespin, brewer, bright, chalk, dracula, eighties, gnome-dark, gruvbox-dark, monokao, nord, seti, tomorrow-night
zplug "chriskempson/base16-shell", use:"scripts/base16-tomorrow-night.sh"

## Can't decide if these are useful or annoying
#zplug "rawkode/zsh-docker-run"
#zplug "rawkode/zsh-gcloud-context-switcher", from:gitlab
#zplug "rawkode/zsh-kubectl-context-switcher", from:gitlab

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"

zplug "plugins/command-not-found",      from:oh-my-zsh
zplug "plugins/colored-man-pages",      from:oh-my-zsh
#zplug "plugins/colorize",               from:oh-my-zsh
zplug "plugins/docker",                 from:oh-my-zsh, if:"(( $+commands[docker] ))"
zplug "plugins/docker-compose",         from:oh-my-zsh, if:"(( $+commands[docker-compose] ))"
zplug "plugins/dotenv",                 from:oh-my-zsh
zplug "plugins/kubectl",                from:oh-my-zsh
zplug "plugins/per-directory-history",  from:oh-my-zsh
zplug "plugins/sudo",                   from:oh-my-zsh
zplug "plugins/z",                      from:oh-my-zsh

zplug 'desyncr/auto-ls'
zplug "hlissner/zsh-autopair"
zplug "Valiev/almostontop"

zplug "junegunn/fzf", use:"shell/*.zsh", as:plugin

zplug "b4b4r07/emoji-cli", as:command, if:"(( $+commands[jq] ))"

#zplug mafredri/zsh-async, from:github
#zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
#zplug "themes/agnoster", from:oh-my-zsh, as:theme
#zplug "eendroroy/alien"
#zplug "geometry-zsh/geometry"
#zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
