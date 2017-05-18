zsh-install:
  pkg.installed:
    - pkgs:
      - bc
      - zsh

nord-gnome-terminal:
  cmd.script:
    - source: https://raw.githubusercontent.com/arcticicestudio/nord-gnome-terminal/develop/src/sh/nord.sh
    - runas: {{ grains.user }}

zsh-zshrc:
  file.managed:
    - name: {{ grains.homedir }}/.zshrc
    - source: salt:///zsh/zshrc
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - template: jinja

zsh-dircolors:
  file.managed:
    - name: {{ grains.homedir }}/.dir_colors
    - source: salt://zsh/dir_colors
    - user: {{ grains.user }}
    - group: {{ grains.user }}

zsh-zshrc.zplug:
  file.managed:
    - name: {{ grains.homedir }}/.zshrc.zplug
    - source: salt:///zsh/zshrc.zplug
    - user: {{ grains.user }}
    - group: {{ grains.user }}

zsh-zshrc-common:
  file.managed:
    - name: {{ grains.homedir }}/.zshrc.common
    - source: salt:///zsh/zshrc.common
    - user: {{ grains.user }}
    - group: {{ grains.user }}

zsh-zshrc-keybindings:
  file.managed:
    - name: {{ grains.homedir }}/.zshrc.keybindings
    - source: salt:///zsh/zshrc.keybindings
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
