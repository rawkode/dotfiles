atom-install:
  cmd.run:
    - name: pacaur -S --noconfirm --noedit atom
    - runas: {{ grains.user }}
