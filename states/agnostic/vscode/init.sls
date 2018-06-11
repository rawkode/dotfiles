{% from './snap/init.sls' import snap with context %}

{{ snap('vscode', '--classic') }}

vscode-sync-settings-ext:
  cmd.run:
    - name: code --install-extension Shan.code-settings-sync
    - runas: {{ grains.user }}
