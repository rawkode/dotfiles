i3-dependencies:
    pkg.installed:
        - pkgs:
            - fonts-font-awesome
            - nitrogen
            - dunst
            - volumeicon-alsa
            - libxcb1-dev
            - libxcb-keysyms1-dev
            - libpango1.0-dev
            - libxcb-util0-dev
            - libyajl-dev
            - libstartup-notification0-dev
            - libxcb-randr0-dev
            - libev-dev
            - libxcb-cursor-dev
            - libxcb-xinerama0-dev
            - libxcb-xkb-dev
            - libxcb-icccm4-dev
            - libxkbcommon-dev
            - libxkbcommon-x11-dev
            - libxinerama-dev
            - autoconf
            - ruby-ronn

i3-gaps:
    git.latest:
        - name: https://github.com/Airblader/i3.git
        - target: /opt/i3-gaps
        - depth: 1
        - require:
            - pkg: i3-dependencies

i3-gaps-make:
    cmd.run:
        - name: make
        - cwd: /opt/i3-gaps
        - require:
            - git: i3-gaps

i3-gaps-make-install:
    cmd.run:
        - name: make install
        - cwd: /opt/i3-gaps
        - require:
            - cmd: i3-gaps-make

rofi:
    git.latest:
        - name: https://github.com/DaveDavenport/rofi.git
        - target: /opt/rofi
        - depth: 1

rofi-build-dir:
    file.directory:
        - name: /opt/rofi/build
        - require:
            - git: rofi

rofi-configure:
    cmd.run:
        - name: ../configure
        - cwd: /opt/rofi/build
        - require:
            - file: rofi-build-dir

rofi-make:
    cmd.run:
        - name: make
        - cwd: /opt/rofi/build
        - require:
            - cmd: rofi-configure

rofi-make-install:
    cmd.run:
        - name: make install
        - cwd: /opt/rofi/build
        - require:
            - cmd: rofi-make

i3blocks:
    git.latest:
        - name: https://github.com/vivien/i3blocks.git
        - target: /opt/i3blocks
        - depth: 1

i3blocks-make:
    cmd.run:
        - name: make clean all
        - cwd: /opt/i3blocks
        - require:
            - git: i3blocks

i3blocks-make-install:
    cmd.run:
        - name: make install
        - cwd: /opt/i3blocks
        - require:
            - cmd: i3blocks-make


i3-configuration-directory:
    file.directory:
        - name: {{ grains.homedir }}/.config/i3
        - user: {{ grains.user }}
        - group: {{ grains.user }}

i3-configuration:
    file.managed:
        - name: {{ grains.homedir }}/.config/i3/config
        - source: salt://i3/config
        - user: {{ grains.user }}
        - group: {{ grains.user }}

i3-configuration-compton:
    file.managed:
        - name: {{ grains.homedir }}/.config/i3/compton.conf
        - source: salt://i3/compton.conf
        - user: {{ grains.user }}
        - group: {{ grains.user }}

i3-configuration-blocks:
    file.managed:
        - name: {{ grains.homedir }}/.config/i3/blocks.conf
        - source: salt://i3/blocks.conf
        - user: {{ grains.user }}
        - group: {{ grains.user }}

i3-configuration-dunst:
    file.managed:
        - name: {{ grains.homedir }}/.config/i3/dunstrc
        - source: salt://i3/dunstrc
        - user: {{ grains.user }}
        - group: {{ grains.user }}

