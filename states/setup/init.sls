packages:
    pkg.installed:
        - pkgs:
            - vim
            - zsh
            - php5-cli

allow-zsh:
    cmd.run:
        - name: echo `which zsh` | sudo tee -a /etc/shells
        - unless: grep "`which zsh`" /etc/shells
        - require:
            - pkg: packages

set-zsh-as-default:
    cmd.run:
        - name: chsh -s `which zsh` {{ grains.user }}
        - require:
            - cmd: allow-zsh

