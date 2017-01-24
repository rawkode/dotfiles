gnupg:
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

gpg-agent-service:
  file.managed:
    - name: {{ grains.homedir }}/.config/systemd/user/gpg-agent.service
    - source: salt://gpg/gpg-agent.service
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - makedirs: True

gpg-agent-enable:
  cmd.run:
    - name: systemctl enable --user gpg-agent
    - runas: {{ grains.user }}
