git:
    pkg.installed

git-config:
    file.managed:
        - name: {{ grains.homedir }}/.gitconfig
        - source: {{ grains.stateroot }}/git/config
        - user: {{ grains.user }}
        - force: True
