wmail:
  cmd.run:
    - name: yaourt -S --noconfirm wmail-bin
    - user: {{ grains.user }}

