include:
  - ./users
  - {{ grains.os_family | lower }}: setup

install-base-packages:
  pkg.installed:
    - pkgs:
      - gnome-tweak-tool
      - jq
      - asciinema
      - yank
      - uuid-runtime

