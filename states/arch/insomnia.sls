insomnia-install:
  cmd.run:
    - name: pacaur -S --noconfirm --noedit insomnia
    - runas: {{ grains.user }}
