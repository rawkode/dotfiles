zsh-install:
  pkg.installed:
    - pkgs:
      - bc
      - zsh

zsh-zshrc:
  file.managed:
    - name: {{ grains.homedir }}/.zshrc
    - source: salt:///zsh/zshrc
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - template: jinja

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
    - name: /opt/fzf

zsh-fzf-clone:
  git.latest:
    - name: https://github.com/junegunn/fzf.git
    - rev: master
    - target: /opt/fzf
    - depth: 1
    - force_reset: True
    - onfail:
      - file: zsh-fzf-installed?

zsh-fzf-install:
  cmd.run:
    - name: sudo /opt/fzf/install --all --64
    - runas: {{ grains.user }}
    - onfail:
      - file: zsh-fzf-installed?

zsh-zplug-installed?:
  file.exists:
    - name: {{ grains.homedir }}/.zplug

zsh-zplug-install:
  cmd.script:
    - name: https://zplug.sh/installer
    - runas: {{ grains.user }}
    - onfail:
      - file: zsh-zplug-installed?
