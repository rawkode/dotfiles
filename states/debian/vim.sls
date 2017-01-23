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

