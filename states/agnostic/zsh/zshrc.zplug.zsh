zplug "chriskempson/base16-shell", use:"scripts/base16-material-darker.sh"
#zplug "carloscuesta/materialshell", use:"zsh/materialshell.zsh-theme"

zplug "rawkode/zsh-docker-run"

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

zplug 'desyncr/auto-ls'

zplug "plugins/git",                    from:oh-my-zsh
zplug "plugins/z",                      from:oh-my-zsh
zplug "plugins/command-not-found",      from:oh-my-zsh
zplug "plugins/colored-man-pages",      from:oh-my-zsh
zplug "plugins/per-directory-history",  from:oh-my-zsh
zplug "plugins/sudo",                   from:oh-my-zsh

zplug "sroze/docker-compose-zsh-plugin"

zplug "Valiev/almostontop"

zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
#zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
