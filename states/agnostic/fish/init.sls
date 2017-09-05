fish-fisherman-installed?:
  file.exists:
    - name: {{ grains.homedir }}/.config/fish/functions/fisher.fish

fish-fisherman:
  cmd.run:
    - name: curl -Lo {{grains.homedir }}/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
    - runas: {{ grains.user }}
    - onfail:
      - file: fish-fisherman-installed?

fish-config:
  file.managed:
    - name: {{ grains.homedir }}/.config/fish/config.fish
    - source: salt://fish/config.fish
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - template: jinja

fish-fishfile:
  file.managed:
    - name: {{ grains.homedir }}/.config/fish/fishfile
    - source: salt://fish/fishfile
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - template: jinja

fish-confd:
  file.recurse:
    - source: salt://fish/conf.d/
    - name: {{ grains.homedir }}/.config/fish/conf.d/
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - clean: True
