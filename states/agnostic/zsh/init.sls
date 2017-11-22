zsh-install:
  pkg.installed:
    - pkgs:
      - zsh

zsh-zshrc:
  file.managed:
    - name: {{ grains.homedir }}/.zshrc
    - source: salt://zsh/zshrc.zsh
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - template: jinja

zsh-zshrc-includes:
  file.recurse:
    - name: {{ grains.homedir }}/.zsh
    - source: salt://zsh/includes/
    - clean: True
    - user: {{ grains.user }}
    - group: {{ grains.user }}

zsh-fzf-installed?:
  file.exists:
    - name: {{ grains.homedir }}/.fzf

zsh-fzf-clone:
  git.latest:
    - name: https://github.com/junegunn/fzf.git
    - rev: master
    - target: {{ grains.homedir }}/.fzf
    - user: {{ grains.user }}
    - depth: 1
    - force_reset: True
    - onfail:
      - file: zsh-fzf-installed?

zsh-fzf-install:
  cmd.run:
    - name: sudo {{ grains.homedir }}/.fzf/install --all --64
    - runas: {{ grains.user }}
    - require:
      - git: zsh-fzf-clone
    - onfail:
      - file: zsh-fzf-installed?

zsh-zplug-installed?:
  file.exists:
    - name: {{ grains.homedir }}/.zplug

zsh-zplug-install:
  git.latest:
    - name: https://github.com/zplug/zplug
    - target: {{ grains.homedir }}/.zplug
    - depth: 1
    - force_reset: True
    - user: {{ grains.user }}
    - onfail:
      - file: zsh-zplug-installed?
