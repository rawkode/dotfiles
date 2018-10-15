i3-configuration:
  file.managed:
    - name: {{ grains.homedir }}/.config/i3/config
    - source: salt://i3/config
    - makedirs: True
    - template: jinja
    - context:
      i3: True
    - user: {{ grains.user }}
    - group: {{ grains.user }}

sway-configuration:
  file.managed:
    - name: {{ grains.homedir }}/.config/sway/config
    - source: salt://i3/config
    - makedirs: True
    - template: jinja
    - context:
      i3: False
    - user: {{ grains.user }}
    - group: {{ grains.user }}

i3-compton:
  file.managed:
    - name: {{ grains.homedir }}/.config/compton.conf
    - source: salt://i3/compton.conf
    - user: {{ grains.user }}
    - group: {{ grains.user }}

i3-polybar:
  file.managed:
    - name: {{ grains.homedir }}/.config/polybar/config
    - source: salt://i3/polybar.ini
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - makedirs: True

i3-dunst:
  file.managed:
    - name: {{ grains.homedir }}/.config/dunst/dunstrc
    - source: salt://i3/dunstrc.ini
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - makedirs: True
