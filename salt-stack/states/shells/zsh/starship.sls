{% from 'aur.sls' import aur with context %}

{{ aur('starship-bin') }}

starship/config:
  file.managed:
    - name: {{ grains.homedir }}/.config/starship.toml
    - source: salt://{{ slspath }}/files/starship.toml
    - user: {{ grains.user }}
