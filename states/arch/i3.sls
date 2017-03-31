i3-install:
  cmd.run:
    - name: pacaur -S --noconfirm --noedit i3-gaps
    - runas: {{ grains.user }}

rofi-install:
  cmd.run:
    - name: pacaur -S --noconfirm --noedit rofi
    - runas: {{ grains.user }}

polybar-install:
  cmd.run:
    - name: pacaur -S --noconfirm --noedit polybar
    - runas: {{ grains.user }}
