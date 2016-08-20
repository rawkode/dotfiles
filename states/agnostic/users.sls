# There's no point in ensuring that rawkode has sudo access prior to removing
# the root password ... because he'll need sudo to run these states
user-root:
  user.present:
    - name: root
    - empty_password: True

user-{{ grains.user }}:
  user.present:
    - name: {{ grains.user }}
    - shell: /usr/bin/zsh
    - remove_groups: False
    - groups:
      - docker
