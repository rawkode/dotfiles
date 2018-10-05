nixos-unstable:
  cmd.run:
    - name: nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable

nixos-includes:
  file.recurse:
    - name: /etc/nixos
    - source: salt://nixos
    - clean: False

nixos-user-configuration:
  file.managed:
    - name: {{ grains.homedir }}/.config/nixpkgs/config.nix
    - source: salt://nixos/user-configuration.nix
    - makedirs: True
    - user: {{ grains.user }}
    - group: {{ grains.user }}

nixos-rebuild:
  cmd.run:
    - name: nixos-rebuild switch