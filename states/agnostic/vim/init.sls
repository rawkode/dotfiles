neovim-ppa:
    pkgrepo.managed:
        - humanname: NeoVim PPA
        - name: ppa:neovim-ppa/unstable

vim-install:
  pkg.latest:
    - refresh: True
    - require:
      - pkgrepo: neovim-ppa
    - pkgs:
      - neovim

dein-install:
  cmd.script:
    - source: https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
    - args: ~/.dein

vim-configuration:
    file.managed:
        - name: {{ grains.homedir }}/.config/nvim/init.vim
        - source: salt://vim/init.vim
        - makedirs: True
        - user: {{ grains.user }}
        - group: {{ grains.user }}

