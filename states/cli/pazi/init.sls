include:
    - .{{ grains.os_family | lower }}

pazi.zsh:
  file.managed:
    - name: {{ grains.homedir }}/.zsh/includes/pazi.zsh
    - source: salt://{{ slspath }}/files/pazi.zsh
    - makedirs: True
    - user: {{ grains.user }}
