{% from "packages.jinja" import packages with context %}

{% if grains['os_family'] == 'Arch' %}
rustup:
    cmd.run:
        - name: yay -Sq --noconfirm rustup
        - runas: {{ grains.user }}
        - require:
            - cmd: yay-makepkg

rustup-nightly:
    cmd.run:
        - name: rustup install nightly
        - runas: {{ grains.user }}

rustup-nightly-default:
    cmd.run:
        - name: rustup default nightly
        - runas: {{ grains.user }}

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

pcscd:
  service.running:
    - enable: True
    - reload: True
    - user: True
