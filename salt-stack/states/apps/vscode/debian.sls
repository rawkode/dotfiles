vscode-debian-repo:
  pkgrepo.managed:
    - humanname: Visual Studio Code
    - name: deb [arch={{ grains['osarch'] }}] https://packages.microsoft.com/repos/vscode stable main
    - file: /etc/apt/sources.list.d/visual-studio-code.list
    - key_url: https://packages.microsoft.com/keys/microsoft.asc

vscode-debian-install:
  pkg.installed:
    - name: code-insiders