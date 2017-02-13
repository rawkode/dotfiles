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

i3-configuration-compton:
    file.managed:
        - name: {{ grains.homedir }}/.config/i3/compton.conf
        - source: salt://i3/compton.conf
        - user: {{ grains.user }}
        - group: {{ grains.user }}

i3-configuration-dunst:
    file.managed:
        - name: {{ grains.homedir }}/.config/i3/dunstrc
        - source: salt://i3/dunstrc
        - user: {{ grains.user }}
        - group: {{ grains.user }}
