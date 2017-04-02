include:
  - ./users
  - {{ grains.os_family | lower }}: setup
  - keybase

install-base-packages:
  pkg.installed:
    - pkgs:
      - gnome-tweak-tool
      - jq
      - asciinema
      - yank
      - xclip
