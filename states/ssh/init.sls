ssh-configuration-directory:
  file.directory:
    - name: {{ grains.homedir }}/.ssh
    - user: {{ grains.user }}

ssh-configuration:
  file.managed:
    - name: {{ grains.homedir }}/.ssh/config
    - source: salt://ssh/config
    - user: {{ grains.user }}
