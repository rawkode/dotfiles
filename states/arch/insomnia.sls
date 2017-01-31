insomnia:
  cmd.run:
    - name: pacaur -S --noconfirm insomnia
    - user: {{ grains.user }}
