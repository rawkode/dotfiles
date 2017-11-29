include:
  - {{ grains.os_family | lower }}: gnome-shell

gnome-shell-number-of-workspaces:
  cmd.run:
    - name: dbus-launch --exit-with-session gsettings set org.gnome.desktop.wm.preferences num-workspaces "5"
    - runas: {{ grains.user }}

gnome-shell-workspace-names:
  cmd.run:
    - name: dbus-launch --exit-with-session gsettings set org.gnome.desktop.wm.preferences workspace-names "['Web', 'Development', 'Communication', 'Productivity', 'Other']"
    - runas: {{ grains.user }}

gnome-shell-touchpad-click-mode:
  cmd.run:
    - name: dbus-launch --exit-with-session gsettings set org.gnome.desktop.peripherals.touchpad click-method "fingers"
    - runas: {{ grains.user }}

gnome-shell-touchpad-tap-to-click:
  cmd.run:
    - name: dbus-launch --exit-with-session gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
    - runas: {{ grains.user }}

gnome-shell-touchpad-natural-scroll:
  cmd.run:
    - name: dbus-launch --exit-with-session gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true
    - runas: {{ grains.user }}

gnome-shell-show-battery-percentage:
  cmd.run:
    - name: dbus-launch --exit-with-session gsettings set org.gnome.desktop.interface show-battery-percentage true
    - runas: {{ grains.user }}

gnome-shell-alt-tab-current-workspace:
  cmd.run:
    - name: dbus-launch --exit-with-session gsettings set org.gnome.shell.app-switcher current-workspace-only true
    - runas: {{ grains.user }}

gnome-shell-vimix-theme:
  git.latest:
    - name: https://github.com/vinceliuice/vimix-gtk-themes.git
    - target: {{ grains.homedir }}/.gnome-shell-themes/vimix
    - user: {{ grains.user }}

gnome-shell-extension-enable-user-themes:
  cmd.run:
    - name: dbus-launch --exit-with-session gnome-shell-extension-tool -e 'user-theme@gnome-shell-extensions.gcampax.github.com' || exit 0
    - runas: {{ grains.user }}

gnome-shell-set-favourite-apps:
  cmd.run:
    - name: dbus-launch --exit-with-session gsettings set org.gnome.shell favorite-apps "['google-chrome.desktop', 'org.gnome.Nautilus.desktop', 'com.gexperts.Tilix.desktop', 'visual-studio-code.desktop', 'wavebox.desktop', 'slack.desktop', 'keybase.desktop']"
    - runas: {{ grains.user }}

# gnome-shell-set-lock-shortcut-name:
#   cmd.run:
#     - name: dbus-launch --exit-with-session gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom0 name "Lock Screen"
#     - runas: {{ grains.user }}

# gnome-shell-set-lock-shortcut-binding:
#   cmd.run:
#     - name: dbus-launch --exit-with-session gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom0 binding "Pause"
#     - runas: {{ grains.user }}

# gnome-shell-set-lock-shortcut-command:
#   cmd.run:
#     - name: dbus-launch --exit-with-session gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom0 command "xsecurelock"
#     - runas: {{ grains.user }}

# gnome-shell-set-custom-shortcuts:
#   cmd.run:
#     - name: dbus-launch --exit-with-session gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings ['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']
#     - runas: {{ grains.user }}
