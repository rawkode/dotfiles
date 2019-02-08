zsh-zshrc:
  file.managed:
    - name: {{ grains.homedir }}/.zshrc
    - source: salt://zsh/zshrc.zsh
    - user: {{ grains.user }}
    - template: jinja

zsh-zshrc-includes:
  file.recurse:
    - name: {{ grains.homedir }}/.zsh
    - source: salt://zsh/includes/
    - clean: True
    - user: {{ grains.user }}

zsh-zplug-installed?:
  file.exists:
    - name: {{ grains.homedir }}/.zplug

zsh-zplug-install:
  git.latest:
    - name: https://github.com/zplug/zplug
    - target: {{ grains.homedir }}/.zplug
    - depth: 1
    - rev: master
    - force_reset: True
    - user: {{ grains.user }}
    - onfail:
      - file: zsh-zplug-installed?
