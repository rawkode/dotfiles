gtk2:
  file.managed:
    - name: {{ grains.homedir }}/.gtkrc-2.0
    - source: salt://{{ slspath }}/files/2.ini
    - user: {{ grains.user }}

gtk3:
  file.managed:
    - name: {{ grains.homedir }}/.config/gtk-3.0/settings.ini
    - source: salt://{{ slspath }}/files/3.ini
    - user: {{ grains.user }}
