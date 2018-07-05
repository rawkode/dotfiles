# Development Aliases
alias dc='docker-compose'
alias dcr='docker-compose run --rm'

alias tree=' tree -L 3 -d -I "vendor|cache|log|logs"'

# Arch
alias pacman=' yay --color=always'
alias pacmanc=' yay -Rns $(pacman -Qtdq)'
alias yayc=' yay -Yc'

# Kubernetes
alias k='kubectl'
alias ka='kubectl apply'
alias kp='kubectl get pods'
alias kd='kubectl get deploy'
alias kl='kubectl logs'
alias kcx='kubectl config get-contexts'
alias ksx='kubectl config use-context'

# Lockscreen
alias lock=" xsecurelock"

# Development aliases
alias dev=' cd ~/Development/src/'

# Fuck typing xdg-open
alias open=' xdg-open'

## Visual Studio Code Adoption
alias vi=' code'
alias vim=' code'
alias nvim=' code'

# cd
alias cd=' cd'

# ls
alias ls=' ls'
alias ll=' ls -l'

# gpg2
alias gpg='gpg2'
