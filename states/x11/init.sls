xresources:
  file.managed:
    - name: {{ grains.homedir }}/.Xresources
    - source: salt://x11/Xresources
    - makedirs: True
    - user: {{ grains.user }}
    - group: {{ grains.user }}