packages-base:
  pkg.installed:
    - pkgs:
      - networkmanager
      - openssh
      - expac
      - yajl
      - the_silver_searcher

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
