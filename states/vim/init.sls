vim-vundle-checkout:
    git.latest:
        - name: https://github.com/VundleVim/Vundle.vim.git
        - rev: master
        - depth: 1
        - target: {{ grains.homedir }}/.vim/bundle/Vundle.vim

vim-vimrc:
    file.symlink:
        - name: {{ grains.homedir }}/.vimrc
        - target:   {{ grains.stateroot }}/vim/vimrc
        - user:     {{ grains.username }}
        - require:
            - git: vim-vundle-checkout

vim-vundle-install:
    cmd.run:
        - name: vim +PluginInstall +qall
        - require:
            - file: vim-vimrc
