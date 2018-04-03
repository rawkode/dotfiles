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

/etc/pacman.conf:
  file.uncomment:
    - regex: Color

packages-base:
  pkg.installed:
    - pkgs:
      - expac
      - htop
      - openssh
      - the_silver_searcher
      - yajl

yay-directory:
  file.directory:
    - name: /opt/yay
    - user: {{ grains['user'] }}

yay-download-installer:
  git.latest:
    - name: https://aur.archlinux.org/yay.git
    - target: /opt/yay

yay-makepkg:
  cmd.run:
    - name: makepkg -i PKGBUILD --noconfirm
    - runas: {{ grains['user'] }}
    - cwd: /opt/yay

# Clean up
remove-epiphany:
  pkg.removed:
    - name: epiphany

include:
  - .aur
