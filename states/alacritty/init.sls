alacritty-config:
  file.managed:
    - name: {{ grains.homedir }}/.config/alacritty/alacritty.yml
    - source: salt://alacritty/alacritty.yml
    - makedirs: True
    - user: {{ grains.user }}
