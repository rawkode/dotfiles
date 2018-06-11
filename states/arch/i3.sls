{% from './aur.sls' import aur with context %}
{{ aur('compton') }}

{{ aur('i3-gaps') }}

{{ aur('rofi') }}

{{ aur('polybar') }}

{{ aur('volti') }}

{{ aur('nitrogen') }}
