{% from './aur.sls' import aur with context %}

{{ aur('arc-gtk-theme') }}
{{ aur('arc-icon-theme') }}

{{ aur('capitaine-cursors') }}
{{ aur('paper-icon-theme-git') }}
{{ aur('materia-theme') }}
{{ aur('vimix-gtk-themes-git') }}
