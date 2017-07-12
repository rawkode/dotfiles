nord-tilix:
  file.managed:
    - name: {{ grains.homedir }}/.config/tilix/schemes/nord.json
    - source: salt://nord-theme/tilex.json
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - makedirs: True

zsh-dircolors:
  file.managed:
    - name: {{ grains.homedir }}/.dir_colors
    - source: salt://nord-theme/dir_colors
    - user: {{ grains.user }}
    - group: {{ grains.user }}
