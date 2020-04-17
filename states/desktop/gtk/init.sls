gtk/v2/config:
  file.managed:
    - name: {{ grains.homedir }}/.gtkrc-2.0
    - source: salt://{{ slspath }}/files/2.ini
    - user: {{ grains.user }}
    - makedirs: True

gtk/v3/config:
  file.managed:
    - name: {{ grains.homedir }}/.config/gtk-3.0/settings.ini
    - source: salt://{{ slspath }}/files/3.ini
    - user: {{ grains.user }}
    - makedirs: True

gtk/themes:
  aur.installed:
    - names:
      - arc-gtk-theme-jnsh-git
      - bibata-cursor-translucent
      - suru-plus-git
