gnome/wayland/pipewire:
  pkg.installed:
    - pkgs:
      - pipewire
      - pipewire-jack
      - pipewire-pulse
      - xdg-desktop-portal
      - xdg-desktop-portal-gtk

gnome/wayland/pipewire/socket:
  cmd.run:
    - name: systemctl --user enable pipewire.socket
    - runas: {{ grains.user }}

  # service.running:
    # - name: pipewire.socket
    # - enable: True
    # - reload: True

gnome/wayland/pipewire/service:
  cmd.run:
    - name: systemctl --user enable pipewire.service
    - runas: {{ grains.user }}
  # service.running:
    # - name: pipewire.service
    # - enable: True
    # - reload: True

gnome/extensions:
  pkg.installed:
    - pkgs:
      - gnome-shell-extension-dash-to-panel
      - gnome-shell-extension-emoji-selector-git
      - gnome-shell-extension-paperwm-git
      - gnome-shell-extension-sound-output-device-chooser-git
