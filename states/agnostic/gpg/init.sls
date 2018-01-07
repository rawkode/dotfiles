include:
  - {{ grains.os_family | lower }}: gpg

gnupg-directory:
  file.directory:
    - name: {{ grains.homedir }}/.gnupg
    - user: {{ grains.user }}
    - group: {{ grains.user }}

gpg-rawkode:
  cmd.run:
    - name: "curl https://keybase.io/rawkode/pgp_keys.asc | gpg --import"
    - runas: {{ grains.user }}

pcscd.socket:
  service.running:
    - enable: True
    - reload: True

gpg-config:
  file.managed:
    - name: {{ grains.homedir }}/.gnupg/gpg.conf
    - source: salt://gpg/gpg.conf
    - user: {{ grains.user }}
    - group: {{ grains.user }}

gpg-agent-config:
  file.managed:
    - name: {{ grains.homedir }}/.gnupg/gpg-agent.conf
    - source: salt://gpg/gpg-agent.conf
    - user: {{ grains.user }}
    - group: {{ grains.user }}

gpg-disable-ssh-agent:
  file.comment:
    - name: /etc/X11/Xsession.options
    - regex: ^use-ssh-agent
    - onlyif:
      - ls /etc/X11/Xsession.options
