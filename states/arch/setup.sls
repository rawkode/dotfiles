packages-base:
  pkg.installed:
    - pkgs:
      - base-devel
      - openssh
      - gnupg

packages-yubikey:
  pkg.installed:
    - pkgs:
      - libusb-compat
      - pcsclite
      - ccid
      - libu2f-host

pcscd.socket:
  service.running:
    - enable: True
    - reload: True

NetworkManager:
  service.running:
    - enable: True
    - reload: True

https://aur.archlinux.org/package-query.git:
  git.latest:
    - target: /tmp/package-query
    - user: {{ grains.user }}

package-query-install:
  cmd.run:
    - name: makepkg -sirc --force --noconfirm
    - cwd: /tmp/package-query
    - user: {{ grains.user }}


https://aur.archlinux.org/yaourt.git:
  git.latest:
    - target: /tmp/yaourt
    - user: {{ grains.user }}

yaourt-install:
  cmd.run:
    - name: makepkg -sirc --force --noconfirm
    - cwd: /tmp/yaourt
    - user: {{ grains.user }}

# Clean up
remove-epiphany:
  pkg.removed:
    - name: epiphany

