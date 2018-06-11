{% from './snap.sls' import snap with context %}

aws-install:
  pkg.installed:
    - pkgs:
      - awscli
      
{{ snap('google-cloud-sdk', '--classic') }}
{{ snap('helm', '') }}
{{ snap('insomnia', '') }}
{{ snap('kubectl', '--classic') }}
