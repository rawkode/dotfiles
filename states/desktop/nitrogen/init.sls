nitrogen:
    pkg.installed

nitrogen/config:
  file.managed:
    - name: {{ grains.homedir }}/.config/nitrogen/nitrogen.cfg
    - source: salt://{{ slspath }}/files/config.ini
    - user: {{ grains.user }}
    - makedirs: True
