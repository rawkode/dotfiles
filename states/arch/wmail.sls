wmail:
  cmd.run:
    - name: pacaur -S --noconfirm wmail-bin
    - user: {{ grains.user }}
