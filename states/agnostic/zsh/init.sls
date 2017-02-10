include:
  - {{ grains.os_family | lower }}: zsh

zsh:
  pkg.installed:
    - pkgs:
      - bc
      - zsh

zsh-antigen-clone:
  git.latest:
    - name: https://github.com/zsh-users/antigen.git
    - rev: master
    - target: /opt/zsh-antigen
    - depth: 1
    - force_reset: True

zsh-base16-clone:
  git.latest:
    - name: https://github.com/chriskempson/base16-shell.git
    - rev: master
    - target: /opt/base16-shell
    - depth: 1

zsh-zshrc:
  file.managed:
    - name: {{ grains.homedir }}/.zshrc
    - source: salt:///zsh/zshrc
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - template: jinja

zsh-zshrc.antigen:
  file.managed:
    - name: {{ grains.homedir }}/.zshrc.antigen
    - source: salt:///zsh/zshrc.antigen
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

fzf-clone:
  git.latest:
    - name: https://github.com/junegunn/fzf.git
    - rev: master
    - target: /opt/fzf
    - depth: 1
    - force_reset: True

fzf-install:
  cmd.run:
    - name: sudo /opt/fzf/install --all --64
    - runas: {{ grains.user }}

zplug-install:
  cmd.run:
    - name:  curl -sL zplug.sh/installer | zsh
    - runas: {{ grains.user }}
