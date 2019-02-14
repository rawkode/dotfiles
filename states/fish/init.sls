fish:
  file.managed:
    - name: {{ grains.homedir }}/.config/fish/config.fish
    - source: salt://fish/config.fish
    - user: {{ grains.user }}
    - makedirs: True

fish-file:
  file.managed:
    - name: {{ grains.homedir }}/.config/fish/fishfile
    - source: salt://fish/fishfile
    - user: {{ grains.user }}
    - makedirs: True

fish-functions:
  file.recurse:
    - name: {{ grains.homedir }}/.config/fish/functions/
    - source: salt://fish/functions
    - user: {{ grains.user }}
    - clean: False
    - makedirs: True

fish-conf:
  file.recurse:
    - name: {{ grains.homedir }}/.config/fish/conf.d/
    - source: salt://fish/conf.d
    - user: {{ grains.user }}
    - clean: False
    - makedirs: True
