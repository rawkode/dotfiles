{% from "packages.jinja" import packages with context %}

{% if grains['os_family'] == 'Arch' %}


packages-install:
    cmd.run:
        - name: yay -Sq --noconfirm {{ packages | join(' ') }}
        - runas: {{ grains.user }}
        - require:
            - cmd: yay-makepkg

{% elif grains['os'] == "Debian" %}

packages-install:
    pkg.installed:
        - pkgs: {{ packages }}

{% endif %}

group-docker:
  group.present:
    - name: docker
    - system: True
    - addusers:
      - {{ grains.user }}

group-libvirt:
  group.present:
    - name: libvirt
    - system: True
    - addusers:
      - {{ grains.user }}
