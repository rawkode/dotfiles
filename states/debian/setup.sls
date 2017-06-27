packages-base:
  pkg.installed:
    - pkgs:
      - build-essential
      - uuid-runtime
      - curl
      - yank

packages-useless:
  pkg.purged:
    - pkgs:
      - firefox
      - rhythmbox
      - aisleriot
      - gnome-mines
      - gnome-sudoku
      - gnome-mahjongg
