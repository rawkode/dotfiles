gtk2:
  file.managed:
    - name: {{ grains.homedir }}/.gtkrc-2.0
    - source: salt://gtk/2.ini
    - user: {{ grains.user }}
    - group: {{ grains.user }}

gtk3:
  file.managed:
    - name: {{ grains.homedir }}/.config/gtk-3.0/settings.ini
    - source: salt://gtk/3.ini
    - user: {{ grains.user }}
    - group: {{ grains.user }}
