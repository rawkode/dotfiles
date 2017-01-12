gtk-dependencies:
    pkg.installed:
        - pkgs:
            - libgtk-3-dev
            - lxappearance
            - arandr

iris-theme:
    git.latest:
        - name: https://github.com/xyl0n/iris.git
        - target: {{ grains.homedir }}/.themes/iris
        - depth: 1

arc-theme:
    git.latest:
        - name: https://github.com/horst3180/arc-theme
        - target: /opt/arc/theme
        - depth: 1

arc-theme-autogen:
    cmd.run:
        - name: ./autogen.sh --prefix=/usr
        - cwd: /opt/arc/theme
        - require:
            - git: arc-theme

arc-theme-install:
    cmd.run:
        - name: make install
        - cwd: /opt/arc/theme
        - require:
            - cmd: arc-theme-autogen

arc-icon-theme:
    git.latest:
        - name: https://github.com/horst3180/arc-icon-theme
        - target: /opt/arc/icon-theme
        - depth: 1

arc-icon-theme-autogen:
    cmd.run:
        - name: ./autogen.sh --prefix=/usr
        - cwd: /opt/arc/icon-theme
        - require:
            - git: arc-icon-theme

arc-icon-theme-install:
    cmd.run:
        - name: make install
        - cwd: /opt/arc/icon-theme
        - require:
            - cmd: arc-icon-theme-autogen
