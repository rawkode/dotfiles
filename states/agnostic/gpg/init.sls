gnupg2:
  pkg.installed

include:
  - {{ grains.os_family | lower }}: gpg

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
