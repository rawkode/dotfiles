{% for aur in [
  'gnome-shell-extension-dash-to-dock-git',
  'gnome-shell-extension-topicons-plus-git',
  'gnome-shell-extension-pixel-saver',
  'gnome-shell-extension-caffeine-git',
  'gnome-shell-extension-workspaces-to-dock',
  'gnome-shell-extension-battery-status-git',
  'gnome-shell-extension-dynamic-top-bar',
  'gnome-shell-extension-gravatar',
  'gnome-shell-extension-docker-integration-git',
  'gnome-shell-extension-impatience-git',
  'gnome-shell-extension-arch-update',
  'gnome-shell-extension-stealmyfocus-git',
  'adapta-gtk-theme',
  'adapta-backgrounds',
  'paper-icon-theme-git',
  'capitaine-cursors'
] %}
install-aur-extension-{{ aur }}:
  cmd.run:
    - name: yaourt -S --noconfirm {{ aur }}
    - user: {{ grains.user }}
{% endfor %}

alt-tab-current-workspace:
  cmd.run:
    - name: gsettings set org.gnome.shell.app-switcher current-workspace-only true

