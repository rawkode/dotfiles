gpg-smart-card-packages-install:
  pkg.installed:
    - pkgs:
      - libusb-compat
      - pcsclite
      - ccid
      - libu2f-host
