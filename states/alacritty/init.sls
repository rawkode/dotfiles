alacritty-config:
  file.managed:
    - name: {{ grains.homedir }}/.alacritty/alacritty.yml
    - source: salt://alacritty/alacritty.yml
    - makedirs: True
    - user: {{ grains.user }}
    - group: {{ grains.user }}
