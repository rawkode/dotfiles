include:
  - {{ grains.os_family | lower }}: gnome-shell

# salt.states.gnomedesktop does exist, but not sure it's worth changing
workspace-number:
  cmd.run:
    - name: gsettings set org.gnome.desktop.wm.preferences num-workspaces "5"
    - user: {{ grains.user }}

workspace-names:
  cmd.run:
    - name: gsettings set org.gnome.desktop.wm.preferences workspace-names "['Web', 'Development', 'Communication', 'Productivity', 'Other']"
    - user: {{ grains.user }}

touchpad-click-mode:
  cmd.run:
    - name: gsettings set org.gnome.desktop.peripherals.touchpad click-method "fingers"
    - user: {{ grains.user }}

touchpad-tap-to-click:
  cmd.run:
    - name: gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
    - user: {{ grains.user }}

touchpad-natural-scroll:
  cmd.run:
    - name: gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true
    - user: {{ grains.user }}

touchpad-two-finger-scroll:
  cmd.run:
    - name: gsettings set org.gnome.desktop.peripherals.touchpad scroll-method "two-finger-scrolling"
    - user: {{ grains.user }}

show-battery-percentage:
  cmd.run:
    - name: gsettings set org.gnome.desktop.interface show-battery-percentage true
    
alt-tab-current-workspace:
  cmd.run:
    - name: gsettings set org.gnome.shell.app-switcher current-workspace-only true

vimix-theme:
  git.latest:
    - name: https://github.com/vinceliuice/vimix-gtk-themes.git
    - target: {{ grains.homedir }}/.gnome-shell-themes/vimix
    - user: {{ grains.user }}
