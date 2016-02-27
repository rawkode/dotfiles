git:
    pkg.installed

git-config:
    file.symlink:
        - name: {{ grains.homedir }}/.gitconfig
        - target: {{ grains.stateroot }}/git/config
        - user: {{ grains.user }}
        - force: True
