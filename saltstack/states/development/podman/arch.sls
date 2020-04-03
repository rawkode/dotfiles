{% from 'aur.sls' import aur with context %}

podman-tools:
  pkg.installed:
    - pkgs:
      - buildah
      - podman
      - skopeo

{{ aur('crun') }}
