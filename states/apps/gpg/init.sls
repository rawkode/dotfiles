gpg/install:
  pkg.installed:
    - pkgs:
      - ccid
      - gnupg
      - pcsclite
      - pcsc-tools

gpg/pcscd/service:
  cmd.run:
    - name: systemctl --user enable pcscd
    - user: {{ grains.user }}
