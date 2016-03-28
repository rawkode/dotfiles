xfce4-panel:
  pkg.installed

xfce4-panel-config:
  file.managed:
      - name: {{ grains.homedir }}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
      - source:   {{ grains.stateroot }}/xfce4-panel/config.xml
      - user:     {{ grains.user }}
      - group:    {{ grains.user }}
      - makedirs: True
      - require:
          - pkg: xfce4-panel
