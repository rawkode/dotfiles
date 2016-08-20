git:
  pkg.installed

git-config:
  file.managed:
    - name: {{ grains.homedir }}/.gitconfig
    - source: salt:///git/config
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - force: True

git-ignore:
  file.managed:
    - name: {{ grains.homedir }}/.gitignore
    - source: salt:///git/ignore
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - force: True
