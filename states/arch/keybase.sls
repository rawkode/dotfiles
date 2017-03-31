keybase-install:
  cmd.run:
    - name: pacaur -S --noconfirm --noedit keybase-bin
    - runas: {{ grains.user }}
