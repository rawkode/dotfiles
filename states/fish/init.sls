fish:
  file.managed:
    - name: {{ grains.homedir }}/.config/fish/config.fish
    - source: salt://fish/config.fish
    - makedirs: True

fishfile:
  file.managed:
    - name: {{ grains.homedir }}/.config/fish/fishfile
    - source: salt://fish/fishfile
    - makedirs: True

functions:
  file.managed:
    - name: {{ grains.homedir }}/.config/fish/conf.d/functions.fish
    - source: salt://fish/functions.fish
    - makedirs: True
