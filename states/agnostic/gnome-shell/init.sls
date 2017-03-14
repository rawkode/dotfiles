include:
  - {{ grains.os_family | lower }}: gnome-shell

# salt.states.gnomedesktop does exist, but not sure it's worth changing
gnome-shell-number-of-workspaces:
  cmd.run:
    - name: gsettings set org.gnome.desktop.wm.preferences num-workspaces "5"
    - user: {{ grains.user }}

gnome-shell-workspace-names:
  cmd.run:
    - name: gsettings set org.gnome.desktop.wm.preferences workspace-names "['Web', 'Development', 'Communication', 'Productivity', 'Other']"
    - user: {{ grains.user }}

gnome-shell-touchpad-click-mode:
  cmd.run:
    - name: gsettings set org.gnome.desktop.peripherals.touchpad click-method "fingers"
    - user: {{ grains.user }}

gnome-shell-touchpad-tap-to-click:
  cmd.run:
    - name: gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
    - user: {{ grains.user }}

gnome-shell-touchpad-natural-scroll:
  cmd.run:
    - name: gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true
    - user: {{ grains.user }}

gnome-shell-touchpad-two-finger-scroll:
  cmd.run:
    - name: gsettings set org.gnome.desktop.peripherals.touchpad scroll-method "two-finger-scrolling"
    - user: {{ grains.user }}

gnome-shell-show-battery-percentage:
  cmd.run:
    - name: gsettings set org.gnome.desktop.interface show-battery-percentage true

gnome-shell-alt-tab-current-workspace:
  cmd.run:
    - name: gsettings set org.gnome.shell.app-switcher current-workspace-only true

gnome-shell-vimix-theme:
  git.latest:
    - name: https://github.com/vinceliuice/vimix-gtk-themes.git
    - target: {{ grains.homedir }}/.gnome-shell-themes/vimix
    - user: {{ grains.user }}
