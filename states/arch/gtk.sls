{% for aur in [
  'gtk-theme-arc-git',
  'paper-icon-theme-git',
  'capitaine-cursors',
  'gtk-theme-united-gnome'
] %}
gtk-install-extension-{{ aur }}:
  cmd.run:
    - name: pacaur -S --noconfirm --noedit {{ aur }}
    - runas: {{ grains.user }}
{% endfor %}
