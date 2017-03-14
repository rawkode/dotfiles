gpg-smart-card-packages-install:
  pkg.installed:
    - pkgs:
      - libusb-1.0-0
      - pcscd
      - libccid
      - u2f-host
      - scdaemon
      - opensc
