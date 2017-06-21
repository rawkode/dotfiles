# There's no point in ensuring that {{ grains.user }} has sudo access prior to removing
# the root password ... because he'll need sudo to run these states
root:
  user.present:
    - name: root
    - empty_password: True

{% if grains.user != 'root' %}
{{ grains.user }}:
  user.present:
    - name: {{ grains.user }}
    - shell: /usr/bin/fish
    - remove_groups: False
    - groups:
      - docker
{% endif %}
