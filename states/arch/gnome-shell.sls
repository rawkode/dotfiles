{% for aur in [
  'gnome-shell-extension-dash-to-dock-git',
  'gnome-shell-extension-topicons-plus-git',
  'gnome-shell-extension-pixel-saver',
  'gnome-shell-extension-caffeine-git',
  'gnome-shell-extension-workspaces-to-dock',
  'gnome-shell-extension-battery-status-git',
  'gnome-shell-extension-dynamic-top-bar',
  'gnome-shell-extension-gravatar',
  'gnome-shell-extension-impatience-git',
  'gnome-shell-extension-arch-update',
  'gnome-shell-extension-stealmyfocus-git'
] %}
gnome-shell-install-extension-{{ aur }}:
  cmd.run:
    - name: pacaur -S --noconfirm --noedit {{ aur }}
    - runas: {{ grains.user }}
{% endfor %}

