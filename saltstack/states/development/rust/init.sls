rustup:
  pkg.installed

rustup-nightly:
    cmd.run:
        - name: rustup install stable
        - runas: {{ grains.user }}

rustup-nightly-default:
    cmd.run:
        - name: rustup default stable
        - runas: {{ grains.user }}
