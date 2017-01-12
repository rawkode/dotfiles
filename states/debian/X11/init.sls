xresources-config:
    file.managed:
        - name:     {{ grains.homedir }}/.Xresources
        - source:   salt://X11/Xresources
        - user:     {{ grains.user }}
        - group:    {{ grains.user }}
        - template: jinja
