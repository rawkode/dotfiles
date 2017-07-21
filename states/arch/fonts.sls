roboto-install:
  cmd.run:
    - name: pacaur -S --noconfirm ttf-roboto ttf-roboto-mono ttf-roboto-slab ttf-hack-powerline-git ttf-fira-code
    - runas: {{ grains.user }}
