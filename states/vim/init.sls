vim-dein-installed?:
  file.exists:
    - name: {{ grains.homedir }}/.dein

vim-install-dein:
  cmd.script:
    - name: https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
    - args: {{ grains.homedir }}/.dein
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - onfail:
      - file: vim-dein-installed?

vim-configuration:
  file.managed:
    - name: {{ grains.homedir }}/.config/nvim/init.vim
    - source: salt://vim/init.vim
    - template: jinja
    - makedirs: True
    - user: {{ grains.user }}
    - group: {{ grains.user }}
