xfce4-terminal:
  pkg.installed

xfce4-terminal-config:
  file.managed:
      - name: {{ grains.homedir }}/.config/xfce4/terminal/terminalrc
      - source:   {{ grains.stateroot }}/xfce4-terminal/terminalrc
      - user:     {{ grains.user }}
      - group:    {{ grains.user }}
      - makedirs: True
      - require:
          - pkg: xfce4-terminal
