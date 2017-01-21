alacritty:
  cmd.run:
    - name: yaourt -S --noconfirm alacritty-git
    - user: {{ grains.user }}

