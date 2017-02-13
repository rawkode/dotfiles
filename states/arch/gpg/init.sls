smart-card-packages:
  pkg.installed:
    - pkgs:
      - libusb-compat
      - pcsclite
      - ccid
      - libu2f-host

gpg-agent-service:
  file.managed:
    - name: {{ grains.homedir }}/.config/systemd/user/gpg-agent.service
    - source: salt://gpg/gpg-agent.service
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - makedirs: True
    - template: jinja

