include:
  - {{ grains.os_family | lower }}: vscode

vscode-sync-settings-ext:
  cmd.run:
    - name: code --install-extension Shan.code-settings-sync
    - runas: {{ grains.user }}
