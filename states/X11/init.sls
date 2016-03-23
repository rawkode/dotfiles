xresources-config:
    file.managed:
        - name:     {{ grains.homedir }}/.Xresources
        - source:   {{ grains.stateroot }}/X11/Xresources
        - user:     {{ grains.user }}
        - group:    {{ grains.user }}
        - template: jinja

urxvt-extension-directory:
    file.directory:
        - name: {{ grains.homedir }}/.urxvt/ext
        - makedirs: True

urxvt-font-size:
    git.latest:
        - name: https://github.com/majutsushi/urxvt-font-size
        - target: /opt/urxvt-font-size

urxvt-enable-extension:
    file.symlink:
        - name: {{ grains.homedir }}/.urxvt/ext/font-size
        - target: /opt/urxvt-font-size
        - require:
            - file: urxvt-extension-directory
