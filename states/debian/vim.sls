vim-add-ppa:
  pkgrepo.managed:
    - humanname: NeoVim PPA
    - name: ppa:neovim-ppa/unstable
    - keyid: 8231B6DD
    - keyserver: keyserver.ubuntu.com

vim-install:
  pkg.installed:
    - require:
      - pkgrepo: vim-add-ppa
    - refresh: True
    - pkgs:
      - neovim
      - python-dev
      - python-pip
      - python3-dev
      - python3-pip
