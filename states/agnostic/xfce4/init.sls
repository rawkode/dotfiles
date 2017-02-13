include:
  - {{ grains.os_family | lower }}: xfce4

xfce4-terminal-config:
  file.managed:
    - name: {{ grains.homedir }}/.config/xfce4/terminal/terminalrc
    - source:   salt://xfce4/terminal.conf
    - user:     {{ grains.user }}
    - group:    {{ grains.user }}
    - makedirs: True
    - require:
      - pkg: xfce4-packages

