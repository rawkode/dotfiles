{% from './snap/init.sls' import snap with context %}

{{ snap('kubectl', '') }}
