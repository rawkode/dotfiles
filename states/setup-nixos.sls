nixos-includes:
  file.recurse:
    - name: /etc/nixos
    - source: salt://nixos
    - clean: False

nixos-rebuild:
  cmd.run:
    - name: nixos-rebuild switch