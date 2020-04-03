keybase/install:
  pkg.installed:
    - pkgs:
      - keybase
      - kbfs

keybase/fs/mountpoint:
  file.directory:
    - name: {{ grains.homedir }}/Keybase
    - user: {{ grains.user }}

keybase/fs/config:
  cmd.run:
    - name: keybase config set mountdir {{ grains.homedir }}/Keybase
    - runas: {{ grains.user }}

keybase/autostart:
  cmd.run:
    - name: keybase ctl autostart --enable
    - runas: {{ grains.user }}
