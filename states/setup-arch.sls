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

/etc/pacman.conf:
  file.uncomment:
    - regex: Color
{% endif %}
