vim-install:
    pkg.installed:
        - pkgs:
            - vim

vim-vundle-checkout:
    git.latest:
        - name: https://github.com/VundleVim/Vundle.vim.git
        - rev: master
        - depth: 1
        - user: {{ grains.user }}
        - target: {{ grains.homedir }}/.vim/bundle/Vundle.vim

vim-vimrc:
    file.managed:
        - name: {{ grains.homedir }}/.vimrc
        - source:   {{ grains.stateroot }}/vim/vimrc
        - user:     {{ grains.user }}
        - group:    {{ grains.user }}
        - template: jinja
        - require:
            - git: vim-vundle-checkout

