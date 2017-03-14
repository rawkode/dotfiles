tmux-install:
  pkg.installed

tmux-config:
  file.managed:
    - name: {{ grains.homedir }}/.tmux.conf
    - source: salt:///tmux/config
    - user: {{ grains.user }}
    - group: {{ grains.user }}
