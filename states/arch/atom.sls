atom-install:
  cmd.run:
    - name: pacaur -S --noconfirm atom
    - user: {{ grains.user }}
