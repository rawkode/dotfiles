{% from "packages.jinja" import packages with context %}

{% if grains['os_family'] == 'Arch' %}
include:
    - setup-arch

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
{% endif %}

pcscd:
  service.running:
    - enable: True
    - reload: True
