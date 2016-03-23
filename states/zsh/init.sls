zsh-install:
    pkg.installed:
        - pkgs:
            - zsh

zsh-antigen-clone:
    git.latest:
        - name: https://github.com/zsh-users/antigen.git
        - rev: master
        - target: /opt/zsh-antigen
        - depth: 1

zsh-base16-clone:
    git.latest:
        - name: https://github.com/chriskempson/base16-shell.git
        - rev: master
        - target: /opt/base16-shell
        - depth: 1

zsh-zshrc:
    file.managed:
        - name:     {{ grains.homedir }}/.zshrc
        - source:   {{ grains.stateroot }}/zsh/zshrc
        - user:     {{ grains.user }}
        - group:    {{ grains.user }}
        - template: jinja

zsh-zshrc.user:
    file.managed:
        - name: {{ grains.homedir }}/.zshrc.user
        - source:   {{ grains.stateroot }}/zsh/zshrc.user
        - user:     {{ grains.user }}
        - group:    {{ grains.user }}

