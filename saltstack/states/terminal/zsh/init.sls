terminal/zsh/install:
  pkg.installed:
    - name: zsh

terminal/zsh/zshrc:
  file.managed:
    - name: {{ grains.homedir }}/.zshrc
    - source: salt://{{ slspath }}/files/zshrc.zsh
    - user: {{ grains.user }}

terminal/zsh/zinit:
  git.latest:
    - name: https://github.com/zdharma/zinit.git
    - target: {{ grains.homedir }}/.zinit/bin
    - depth: 1
    - rev: master
    - force_reset: True
    - user: {{ grains.user }}
    - unless: ls {{ grains.homedir }}/.zinit/bin

terminal/zsh/zinitrc:
  file.managed:
    - name: {{ grains.homedir }}/.zsh/zinit.zsh
    - source: salt://{{ slspath }}/files/zinit.zsh
    - user: {{ grains.user }}

terminal/zsh/includes:
  file.recurse:
    - name: {{ grains.homedir }}/.zsh/includes
    - makedirs: True
    - source: salt://{{ slspath }}/files/includes/
    - clean: True
    - user: {{ grains.user }}

