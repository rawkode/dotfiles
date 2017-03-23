x11-config:
  file.managed:
    - name:     {{ grains.homedir }}/.Xresources
    - source:   salt://x11/Xresources
    - user:     {{ grains.user }}
    - group:    {{ grains.user }}
    - template: jinja

x11-touchpad:
  file.managed:
    - name: /etc/x11/xorg.conf.d/90-trackpad.conf
    - source: salt://x11/xorg.conf.d/20-natural-scrolling.conf
    - user: root
    - group: root
    - makedirs: True
