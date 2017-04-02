{% for aur in [
  'flatplat-theme',
  'gtk-theme-arc-git',
  'adapta-gtk-theme',
  'adapta-backgrounds',
  'paper-icon-theme-git',
  'capitaine-cursors',
  'gtk-theme-iris-dark-git',
  'gtk-theme-iris-light-git'
] %}
gtk-install-extension-{{ aur }}:
  cmd.run:
    - name: pacaur -S --noconfirm --noedit {{ aur }}
    - runas: {{ grains.user }}
{% endfor %}
