include:
    - .{{ grains.os_family | lower }}

vscode-sync-settings-ext:
  cmd.run:
    - name: code --install-extension Shan.code-settings-sync
    - runas: {{ grains.user }}
    - unless: code --list-extensions | grep Shan.code-settings-sync

vscode-insiders-sync-settings-ext:
  cmd.run:
    - name: code-insiders --install-extension Shan.code-settings-sync
    - runas: {{ grains.user }}
    - unless: code-insiders --list-extensions | grep Shan.code-settings-sync
