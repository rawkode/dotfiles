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

pam-environment:
  file.managed:
    - name: {{ grains.homedir }}/.pam_environment
    - source: salt://gpg/pam-environment
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

