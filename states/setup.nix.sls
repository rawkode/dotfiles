nixos-includes:
  file.recurse:
    - name: /etc/nixos
    - source: salt://nixos
    - clean: False
