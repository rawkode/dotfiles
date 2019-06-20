include:
    - ./{{ grains['os_family'] | lower }}

vscode-sync-settings-ext:
  cmd.run:
    - name: code-insiders --install-extension Shan.code-settings-sync
    - runas: {{ grains.user }}
