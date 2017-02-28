global-base-packages:
  pkg.installed:
    - pkgs:
      - gnome-tweak-tool
      - jq
      - asciinema
      - yank

include:
  - {{ grains.os_family | lower }}: setup
