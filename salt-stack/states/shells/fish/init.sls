fish:
  file.managed:
    - name: {{ grains.homedir }}/.config/fish/config.fish
    - source: salt://{{ slspath }}/files/config.fish
    - user: {{ grains.user }}
    - makedirs: True

fish-file:
  file.managed:
    - name: {{ grains.homedir }}/.config/fish/fishfile
    - source: salt://{{ slspath }}/files/fishfile
    - user: {{ grains.user }}
    - makedirs: True

fish-functions:
  file.recurse:
    - name: {{ grains.homedir }}/.config/fish/functions/
    - source: salt://{{ slspath }}/files/functions
    - user: {{ grains.user }}
    - clean: False
    - makedirs: True

fish-conf:
  file.recurse:
    - name: {{ grains.homedir }}/.config/fish/conf.d/
    - source: salt://{{ slspath }}/files/conf.d
    - user: {{ grains.user }}
    - clean: False
    - makedirs: True
