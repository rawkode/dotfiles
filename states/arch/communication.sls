{% from './aur.sls' import aur with context %}

{{ aur('slack-desktop') }}
{{ aur('wavebox-bin-beta') }}