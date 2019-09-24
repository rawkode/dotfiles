# Arch
alias pacman=' yay --color=always'
alias pacmanc=' yay -Rns $(pacman -Qtdq)'
alias yayc=' yay -Yc'

# Git
alias git=' hub'

# Lockscreen
alias lock=" xsecurelock"

# Development aliases
alias dev=' cd /code/src/'
alias sand=' cd /code/sandbox/'

# Fuck typing xdg-open
alias open=' xdg-open'

## Visual Studio Code Adoption
alias vi=' code'
alias vim=' code'
alias nvim=' code'

# cd
alias cd=' cd'

# ls
TREE_IGNORE="cache|log|logs|node_modules|vendor"

alias tree=' tree -L 3 -d -I "vendor|cache|log|logs"'
alias ls=' exa --group-directories-first'
alias la=' ls -a'
alias ll=' ls -l'
alias lt=' ls --tree -L 2 -I ${TREE_IGNORE}'
alias ltt=' ls --tree -L 3 -I ${TREE_IGNORE}'
alias lttt=' ls --tree -L 4 -I ${TREE_IGNORE}'
alias ltttt=' ls --tree -L 5 -I ${TREE_IGNORE}'

# SaltStack
alias scl='sudo salt-call --local --config=.'
