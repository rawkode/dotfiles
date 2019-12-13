include:
  - .starship

zsh-packages-install:
  pkg.installed:
    - pkgs:
      - zsh

zsh-zplugin-install:
  git.latest:
    - name: https://github.com/zdharma/zplugin.git
    - target: {{ grains.homedir }}/.zplugin/bin
    - depth: 1
    - rev: master
    - force_reset: True
    - user: {{ grains.user }}
    - unless: ls {{ grains.homedir }}/.zplugin/bin

zsh-zplugin-compile:
  cmd.run:
    - name: zcompile {{ grains.homedir }}/.zplugin/bin/zplugin.zsh
    - runas: {{ grains.user }}
    - shell: /usr/bin/zsh
