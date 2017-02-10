global-base-packages:
  pkg.installed:
    - pkgs:
      - gnome-tweak-tool
      - jq

include:
  - {{ grains.os_family | lower }}: setup
