yubico-ppa:
  pkgrepo.managed:
    - humanname: Yubico PPA
    - name: ppa:yubico/stable
    - keyid: 32CBA1A9
    - keyserver: keyserver.ubuntu.com

gpg-smart-card-packages-install:
  pkg.installed:
    - require:
      - pkgrepo: yubico-ppa
    - refresh: True
    - pkgs:
      - gnupg2
      - libusb-1.0-0
      - pcscd
      - libccid
      - u2f-host
      - libu2f-host0
      - scdaemon
      - opensc
