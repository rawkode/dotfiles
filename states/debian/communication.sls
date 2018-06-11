{% from './snap.sls' import snap with context %}

{{ snap('slack', '') }}
{{ snap('wavebox', '') }}