alacritty:
  cmd.run:
    - name: pacaur -S --noconfirm alacritty-git
    - user: {{ grains.user }}
