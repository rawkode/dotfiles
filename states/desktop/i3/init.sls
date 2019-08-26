include:
  - desktop.x11

i3/install:
  pkg.installed:
    - pkgs:
      - compton
      - dunst
      - i3-gaps

i3-configuration:
  file.managed:
    - name: {{ grains.homedir }}/.config/i3/config
    - source: salt://{{ slspath }}/files/config
    - makedirs: True
    - template: jinja
    - context:
      i3: True
    - user: {{ grains.user }}

i3-compton:
  file.managed:
    - name: {{ grains.homedir }}/.config/compton.conf
    - source: salt://{{ slspath }}/files/compton.conf
    - user: {{ grains.user }}

i3-polybar:
  file.managed:
    - name: {{ grains.homedir }}/.config/polybar/config
    - source: salt://{{ slspath }}/files/polybar.ini
    - user: {{ grains.user }}
    - makedirs: True

i3-dunst:
  file.managed:
    - name: {{ grains.homedir }}/.config/dunst/dunstrc
    - source: salt://{{ slspath }}/files/dunstrc.ini
    - user: {{ grains.user }}
    - makedirs: True
