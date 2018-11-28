rofi-wifi-config:
  file.managed:
    - name: {{ grains.homedir }}/.config/rofi/wifi
    - source: salt://rofi/wifi
    - makedirs: True
    - user: {{ grains.user }}
    - group: {{ grains.user }}
