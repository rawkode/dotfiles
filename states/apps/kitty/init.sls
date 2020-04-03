kitty/config:
  file.managed:
    - name: {{ grains.homedir }}/.config/kitty/kitty.conf
    - source: salt://{{ slspath }}/files/kitty.conf
    - user: {{ grains.user }}
    - makedirs: True
