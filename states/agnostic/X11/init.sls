xresources-config:
    file.managed:
        - name:     {{ grains.homedir }}/.Xresources
        - source:   salt://X11/Xresources
        - user:     {{ grains.user }}
        - group:    {{ grains.user }}
        - template: jinja
touchpad:
  file.managed:
    - name: /etc/X11/xorg.conf.d/90-trackpad.conf
    - source: salt://X11/xorg.conf.d/20-natural-scrolling.conf
    - user: root
    - group: root

