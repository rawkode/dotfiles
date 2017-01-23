include:
  - {{ grains.os_family | lower }}: vim

dein-install:
  cmd.script:
    - source: https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
    - args: ~/.dein
    - user: {{ grains.user }}
    - group: {{ grains.user }}

vim-configuration:
    file.managed:
        - name: {{ grains.homedir }}/.config/nvim/init.vim
        - source: salt://vim/init.vim
        - template: jinja
        - makedirs: True
        - user: {{ grains.user }}
        - group: {{ grains.user }}

