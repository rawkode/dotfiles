xresources-config:
    file.managed:
        - name:     {{ grains.homedir }}/.Xresources
        - source:   {{ grains.stateroot }}/X11/Xresources
        - user:     {{ grains.user }}
        - group:    {{ grains.user }}
        - template: jinja

