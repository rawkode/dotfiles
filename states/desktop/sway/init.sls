sway/install:
  pkg.installed:
    - pkgs:
      - sway
      - swaybg
      - swayidle
      - swaylock
      - waybar

sway/configuration:
  file.managed:
    - name: {{ grains.homedir }}/.config/sway/config
    - source: salt://{{ slspath }}/files/config
    - makedirs: True
    - template: jinja
    - user: {{ grains.user }}
