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

NetworkManager:
  service.running:
    - enable: True
    - reload: True

pacaur-cower-gpg-key:
  cmd.run:
    - name: gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53
    - runas: {{ grains.user }}

pacaur-cower-dir:
  file.directory:
    - name: /tmp/cower
    - user: {{ grains.user }}

pacaur-cower-download-installer:
  cmd.run:
    - name: curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower
    - runas: {{ grains.user }}
    - cwd: /tmp/cower

pacaur-cower-makepkg:
  cmd.run:
    - name: makepkg -i PKGBUILD --noconfirm
    - runas: {{ grains.user }}
    - cwd: /tmp/cower

pacaur-dir:
  file.directory:
    - name: /tmp/pacaur
    - user: {{ grains.user }}

pacaur-download-installer:
  cmd.run:
    - name: curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur
    - runas: {{ grains.user }}
    - cwd: /tmp/pacaur

pacaur-makepkg:
  cmd.run:
    - name: makepkg -i PKGBUILD --noconfirm
    - runas: {{ grains.user }}
    - cwd: /tmp/pacaur

# Clean up
remove-epiphany:
  pkg.removed:
    - name: epiphany

include:
  - .aur
