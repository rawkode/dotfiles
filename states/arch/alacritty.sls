alacritty-install:
  cmd.run:
    - name: pacaur -S --noconfirm --noedit alacritty-git
    - runas: {{ grains.user }}
