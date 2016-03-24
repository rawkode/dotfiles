xfce4-terminal:
  pkg.installed

xfce4-terminal-config:
  file.managed:
      - name: {{ grains.homedir }}/.config/xfce4/terminal/terminalrc
      - source:   {{ grains.stateroot }}/xfce4-terminal/terminalrc
      - user:     {{ grains.username }}
      - group:    {{ grains.username }}
      - require:
          - pkg: xfce4-terminal
