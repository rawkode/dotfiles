google-chrome-install:
  cmd.run:
    - name: pacaur -S --noconfirm --noedit google-chrome
    - runas: {{ grains.user }}
