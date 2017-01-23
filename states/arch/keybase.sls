keybase:
  cmd.run:
    - name: yaourt -S --noconfirm keybase-bin
    - user: {{ grains.user }}

