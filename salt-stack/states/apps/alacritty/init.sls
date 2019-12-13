alacritty:
  pkg.installed

alacritty.config:
  file.managed:
    - name: {{ grains.homedir }}/.config/alacritty/alacritty.yml
    - source: salt://{{ slspath }}/files/alacritty.yml
    - makedirs: True
    - user: {{ grains.user }}
