{% if grains['os'] == 'Antergos' %}
# Thanks for the Cnchi though!
remove-antergos-components:
  cmd.run:
    - name: pacman -Rd --noconfirm $(paclist antergos | awk '{print $1}')
    - onlyif:
      - ls /etc/pacman.d/antergos-mirrorlist

remove-antergos-repository:
  file.line:
    - name: /etc/pacman.conf
    - match: antergos
    - mode: delete
    - content:
{% endif %}

packages-base:
  pkg.installed:
    - pkgs:
      - expac
      - htop
      - networkmanager
      - openssh
      - the_silver_searcher
      - yajl

# Clean up
remove-epiphany:
  pkg.removed:
    - name: epiphany
