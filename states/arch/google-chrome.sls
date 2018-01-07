{% from './aur.sls' import aur with context %}

{{ aur('google-chrome') }}
{{ aur('chrome-gnome-shell-git') }}
