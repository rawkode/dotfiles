include:
  - {{ grains.os_family | lower }}: i3

i3-configuration-directory:
  file.directory:
    - name: {{ grains.homedir }}/.config/i3
    - user: {{ grains.user }}
    - group: {{ grains.user }}

i3-configuration:
  file.managed:
    - name: {{ grains.homedir }}/.config/i3/config
    - source: salt://i3/config
    - user: {{ grains.user }}
    - group: {{ grains.user }}
