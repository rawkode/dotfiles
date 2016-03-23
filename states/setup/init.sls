allow-zsh:
    cmd.run:
        - name: echo `which zsh` | sudo tee -a /etc/shells
        - unless: grep "`which zsh`" /etc/shells

set-zsh-as-default:
    cmd.run:
        - name: chsh -s `which zsh` {{ grains.user }}
