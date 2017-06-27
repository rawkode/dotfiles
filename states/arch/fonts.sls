roboto-install:
  cmd.run:
    - name: pacaur -S --noconfirm ttf-roboto-mono ttf-roboto-slab ttf-hack-powerline-git ttf-roboto-mono-powerline-git
    - runas: {{ grains.user }}
