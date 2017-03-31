gpg-smart-card-packages-install:
  pkg.installed:
    - pkgs:
      - gnupg
      - libusb-compat
      - pcsclite
      - ccid
      - libu2f-host
