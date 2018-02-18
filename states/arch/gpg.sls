gpg-smart-card-packages-install:
  pkg.installed:
    - pkgs:
      - gnupg
      - libusb-compat
      - pcsclite
      - ccid
      - opensc
      - libu2f-host
