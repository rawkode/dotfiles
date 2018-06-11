packages-base:
  pkg.installed:
    - pkgs:
      - build-essential
      - chrome-gnome-shell
      - curl
      - uuid-runtime
      - yank

packages-useless:
  pkg.purged:
    - pkgs:
      - aisleriot
      - gnome-mahjongg
      - gnome-mines
      - gnome-sudoku
      - rhythmbox
