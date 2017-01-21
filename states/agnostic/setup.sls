global-base-packages:
  pkg.installed:
    - pkgs:
      - gnome-tweak-tool

include:
  - {{ grains.os_family | lower }}: setup
