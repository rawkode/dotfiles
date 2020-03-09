{ config, pkgs, ... }:

{
  home.packages = (with pkgs; [
    vscode
  ]);

  imports = [
    "${builtins.fetchGit {
      url = "https://github.com/msteen/nixos-vsliveshare.git";
      ref = "refs/heads/master";
    }}/modules/vsliveshare/home.nix"
  ];

  services.vsliveshare = {
    enable = true;
    extensionsDir = "$HOME/.vscode/extensions";

    nixpkgsPath = builtins.fetchGit {
      url = "https://github.com/NixOS/nixpkgs.git";
      ref = "refs/heads/nixos-20.03";
      rev = "61cc1f0dc07c2f786e0acfd07444548486f4153b";
    };
  };
}

