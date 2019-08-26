{% from 'aur.sls' import aur with context %}

{{ aur('docker-machine-driver-kvm2') }}
{{ aur('kind-bin') }}
{{ aur('skaffold') }}
{{ aur('telepresence') }}
