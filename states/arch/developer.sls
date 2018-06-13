{% from './aur.sls' import aur with context %}

{{ aur('aws-cli') }}
{{ aur('google-cloud-sdk') }}
{{ aur('insomnia') }}
{{ aur('ksonnet-bin') }}
{{ aur('kubectl-bin') }}
{{ aur('kubernetes-helm') }}
{{ aur('terraform') }}
{{ aur('vagrant-libvirt') }}

developer-other-packages:
  pkg.installed:
    - pkgs:
      - npm
      - virtualbox
      - vagrant
