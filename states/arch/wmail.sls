wmail-install:
  cmd.run:
    - name: pacaur -S --noconfirm wmail-bin
    - runas: {{ grains.user }}
