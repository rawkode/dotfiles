gnome-desktop:
  pkg.installed

{% from 'aur.sls' import aur with context %}

{{ aur('gnome-shell-extension-paperwm-git') }}
