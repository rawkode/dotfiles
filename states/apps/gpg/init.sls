gpg/install:
  pkg.installed:
    - pkgs:
      - ccid
      - gnupg
      - pcsclite
      - pcsc-tools

pcscd.service:
  service.running:
    - enable: True
    - reload: True

pcscd.socket:
  service.running:
    - enable: True
    - reload: True
