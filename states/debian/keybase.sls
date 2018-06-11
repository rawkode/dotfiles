keybase-deps:
  pkg.installed:
    - pkgs:
      - libappindicator1

keybase-install:
  pkg.installed:
    - sources:
      - keybase: https://prerelease.keybase.io/keybase_amd64.deb

keybase-run:
  cmd.run:
    - name: run_keybase
    - runas: {{ user }}
    