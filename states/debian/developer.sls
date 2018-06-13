{% from './snap.sls' import snap with context %}

aws-install:
  pkg.installed:
    - pkgs:
      - awscli

vagrant-packages:
  pkg.installed:
    - pkgs:
      - virtualbox
      - vagrant
      - vagrant-libvirt

{{ snap('google-cloud-sdk', '--classic') }}
{{ snap('helm', '') }}
{{ snap('insomnia', '') }}
{{ snap('kubectl', '--classic') }}
