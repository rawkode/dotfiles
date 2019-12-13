nitrogen:
    pkg.installed

nitrogen/wallpapers/download:
  file.managed:
    - name: {{ grains.homedir }}/Pictures/Wallpapers/Stargate - 01.jpg
    - source: https://rawkode.keybase.pub/pictures/wallpapers/Stargate/Stargate%202.jpg
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - makedirs: True
    - skip_verify: True

nitrogen/config:
  file.managed:
    - name: {{ grains.homedir }}/.config/nitrogen/nitrogen.cfg
    - source: salt://{{ slspath }}/files/nitrogen.ini
    - user: {{ grains.user }}
    - makedirs: True
