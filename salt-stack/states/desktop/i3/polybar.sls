{% from 'aur.sls' import aur with context %}

{{ aur('polybar') }}

polybar/config:
  file.managed:
    - name: {{ grains.homedir }}/.config/polybar/config
    - source: salt://{{ slspath }}/files/polybar.ini
    - user: {{ grains.user }}
    - makedirs: True
