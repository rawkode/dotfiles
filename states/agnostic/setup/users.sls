# There's no point in ensuring that {{ grains.user }} has sudo access prior to removing
# the root password ... because he'll need sudo to run these states
root:
  user.present:
    - name: root
    - empty_password: True

{% if grains.user != 'root' %}
group-{{ grains.user }}:
  group.present:
    - name: {{ grains.user }}

user-{{ grains.user }}:
  user.present:
    - name: {{ grains.user }}
    - shell: /usr/bin/zsh
    - remove_groups: False
    - groups:
      - {{ grains.user }}
      - docker
{% endif %}
