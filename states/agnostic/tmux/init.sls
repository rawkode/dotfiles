tmux:
  pkg.installed

tmux-tpm:
  git.latest:
    - name: https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    - target: {{ grains.homedir }}/.tmux/plugins/tpm
    - rev: master
    - user: {{ grains.user }}
    - depth: 1
    - force_reset: True

tmux-config:
  file.managed:
    - name: {{ grains.homedir }}/.tmux.conf
    - source: salt:///tmux/config
    - user: {{ grains.user }}
    - group: {{ grains.user }}
