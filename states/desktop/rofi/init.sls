rofi-wifi-config:
  file.managed:
    - name: {{ grains.homedir }}/.config/rofi/wifi
    - source: salt://{{ slspath }}/files/wifi
    - makedirs: True
    - user: {{ grains.user }}
