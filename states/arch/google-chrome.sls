google-chrome:
  cmd.run:
    - name: yaourt -S --noconfirm google-chrome
    - user: {{ grains.user }}

