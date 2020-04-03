alacritty/config:
  file.managed:
    - name: {{ grains.homedir }}/.config/alacritty/alacritty.yml
    - source: salt://{{ slspath }}/files/alacritty.yml
    - user: {{ grains.user }}
    - makedirs: True
