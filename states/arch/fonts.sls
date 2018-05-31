{% from './aur.sls' import aur with context %}

{{ aur('ttf-google-fonts-git') }}
{{ aur('ttf-fira-mono') }}
{{ aur('noto-fonts-emoji') }}
