zsh-zshrc:
  file.managed:
    - name: {{ grains.homedir }}/.zshrc
    - source: salt://zsh/zshrc.zsh
    - user: {{ grains.user }}
    - template: jinja

zsh-zshrc-includes:
  file.recurse:
    - name: {{ grains.homedir }}/.zsh/includes
    - makedirs: True
    - source: salt://zsh/includes/
    - clean: True
    - user: {{ grains.user }}

zsh-zplugin-config:
  file.managed:
    - name: {{ grains.homedir }}/.zsh/zplugin.zsh
    - source: salt://zsh/zplugin.zsh
    - user: {{ grains.user }}
    - template: jinja

zsh-zplugin-installed?:
  file.exists:
    - name: {{ grains.homedir }}/.zplugin/bin

zsh-zplugin-install:
  git.latest:
    - name: https://github.com/zdharma/zplugin.git
    - target: {{ grains.homedir }}/.zplugin/bin
    - depth: 1
    - rev: master
    - force_reset: True
    - user: {{ grains.user }}
    - onfail:
      - file: zsh-zplugin-installed?

zsh-zplugin-compile:
  cmd.run:
    - name: zcompile {{ grains.homedir }}/.zplugin/bin/zplugin.zsh
    - runas: {{ grains.user }}
    - shell: /usr/bin/zsh
