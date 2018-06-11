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
