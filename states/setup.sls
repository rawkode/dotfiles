zsh:
  pkg.installed

# There's no point in ensuring that {{ grains.user }} has sudo access prior to removing
# the root password ... because sudo is needed to run these states
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
{% endif %}

include:
    - setup-{{ grains['os_family'] | lower }}
