i3-install:
  cmd.run:
    - name: pacaur -S --noconfirm i3-gaps
    - user: {{ grains.user }}

rofi-install:
  cmd.run:
    - name: pacaur -S --noconfirm rofi
    - user: {{ grains.user }}

polybar-install:
  cmd.run:
    - name: pacaur -S --noconfirm polybar
    - user: {{ grains.user }}
