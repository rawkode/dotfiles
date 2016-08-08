xfce4-packages:
  pkg.installed:
    - pkgs:
      - xfce4-panel
      - xfce4-terminal

xfce4-panel-config:
  file.managed:
    - name: {{ grains.homedir }}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
    - source:   {{ grains.stateroot }}/xfce4/panel-config.xml
    - user:     {{ grains.user }}
    - group:    {{ grains.user }}
    - makedirs: True
    - require:
      - pkg: xfce4-packages

xfce4-terminal-config:
  file.managed:
    - name: {{ grains.homedir }}/.config/xfce4/terminal/terminalrc
    - source:   {{ grains.stateroot }}/xfce4/terminal.conf
    - user:     {{ grains.user }}
    - group:    {{ grains.user }}
    - makedirs: True
    - require:
      - pkg: xfce4-packages
