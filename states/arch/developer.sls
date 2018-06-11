{% from './aur.sls' import aur with context %}

{{ aur('aws-cli') }}
{{ aur('google-cloud-sdk') }}
{{ aur('insomnia') }}
{{ aur('kubectl-bin') }}
{{ aur('kubernetes-helm') }}