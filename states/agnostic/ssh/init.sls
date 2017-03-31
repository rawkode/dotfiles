ssh-config:
  file.managed:
    - name: {{ grains.homedir }}/.ssh/config
    - source: salt://ssh/config
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - makedirs: True
