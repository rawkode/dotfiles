{% from "packages.jinja" import packages with context %}

{% if grains['os_family'] == 'Arch' %}
include:
    - setup-arch

packages-install:
    cmd.run:
        - name: yay -Sq --noconfirm {{ packages | join(' ') }}
        - runas: {{ grains.user }}
        - require:
            - cmd: yay-makepkg

base16-shell:
  git.latest:
    - name: https://github.com/chriskempson/base16-shell.git
    - target: {{ grains.homedir }}/.config/base16-shell
    - user: {{ grains.user }}
{% endif %}

pcscd:
  service.running:
    - enable: True
    - reload: True
