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
    file.symlink:
        - name:     {{ grains.homedir }}/.zshrc
        - target:   {{ grains.stateroot }}/zsh/zshrc
        - user:     {{ grains.user }}
        - group:    {{ grains.user }}
        - template: jinja

zsh-zshrc.user:
    file.symlink:
        - name: {{ grains.homedir }}/.zshrc.user
        - target:   {{ grains.stateroot }}/zsh/zshrc.user
        - user:     {{ grains.user }}
        - group:    {{ grains.user }}

