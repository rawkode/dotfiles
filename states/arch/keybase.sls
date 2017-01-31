keybase:
  cmd.run:
    - name: pacaur -S --noconfirm keybase-bin
    - user: {{ grains.user }}
