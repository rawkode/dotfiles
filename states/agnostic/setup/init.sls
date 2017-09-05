include:
  - ./users
  - {{ grains.os_family | lower }}: setup
  - keybase

install-base-packages:
  pkg.installed:
    - pkgs:
      - asciinema
      - fish
      - gnome-tweak-tool
      - jq
      - tilix
      - tree
      - weechat
      - xclip
