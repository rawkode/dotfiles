keybase:
  pkg.installed:
    - pkgs:
      - keybase
      - kbfs

keybase/mountpapth:
  file.directory:
    - name: {{ grains.homedir }}/Keybase
    - makedirs: True
    - user: {{ grains.user }}
    - force: True

keybase/config/mountpath:
  cmd.run:
    - name: keybase config set mountdir {{ grains.homedir }}/Keybase
    - runas: {{ grains.user }}

keybase/config/autostart:
  cmd.run:
    - name: keybase ctl autostart --enable
    - runas: {{ grains.user }}
