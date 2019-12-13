include:
    - .{{ grains.os_family | lower }}

yubikey-gpg-packages:
  pkg.installed:
    - pkgs:
      - ccid
      - gnupg
      - pcsclite
      - pcsc-tools
      - yubikey-personalization

pcscd-services:
  service.running:
    - names:
      - pcscd.service
      - pcscd.socket
    - enable: True

gpg-directory:
  file.directory:
    - name: {{ grains.homedir }}/.gnupg
    - user: {{ grains.user }}

gpg-rawkode:
  cmd.run:
    - name: "curl https://keybase.io/rawkode/pgp_keys.asc | gpg --import"
    - runas: {{ grains.user }}

gpg-config:
  file.managed:
    - name: {{ grains.homedir }}/.gnupg/gpg.conf
    - source: salt://{{ slspath }}/files/gpg.conf
    - user: {{ grains.user }}

gpg-agent-config:
  file.managed:
    - name: {{ grains.homedir }}/.gnupg/gpg-agent.conf
    - source: salt://{{ slspath }}/files/gpg-agent.conf
    - user: {{ grains.user }}

gpg-scdaemon-config:
  file.managed:
    - name: {{ grains.homedir }}/.gnupg/scdaemon.conf
    - source: salt://{{ slspath }}/files/scdaemon.conf
    - user: {{ grains.user }}

gpg-disable-ssh-agent:
  file.comment:
    - name: /etc/X11/Xsession.options
    - regex: ^use-ssh-agent
    - onlyif:
      - ls /etc/X11/Xsession.options
