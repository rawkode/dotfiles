vim/install:
  aur.install:
    - name: neovim

vim/dein/install:
  cmd.script:
    - name: https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
    - args: {{ grains.homedir }}/.dein
    - runas: {{ grains.user }}
    - unless: ls {{ grains.homedir }}/.dein

vim/configuration:
  file.managed:
    - name: {{ grains.homedir }}/.config/nvim/init.vim
    - source: salt://{{ slspath }}/files/init.vim
    - template: jinja
    - makedirs: True
    - user: {{ grains.user }}
