xresources:
  file.managed:
    - name: {{ grains.homedir }}/.Xresources
    - source: salt://x11/Xresources
    - makedirs: True
    - user: {{ grains.user }}

libinput:
  file.managed:
    - name: {{ grains.homedir }}/.config/libinput-gestures.conf
    - source: salt://x11/libinput-gestures.conf
    - makedirs: True
    - user: {{ grains.user }}

trackpad-cofig:
  file.managed:
    - name: /etc/X11/xorg.conf.d/50-synaptics.conf
    - source: salt://x11/libinput.conf
