{ config, pkgs, ... }:

{
  home.packages = (with pkgs; [
    bat
    direnv
    exa
    fzf
    ripgrep
    tldr
    unzip
    vim
    wget
    zsh
  ]);

  programs.direnv.enable = true;
  programs.ssh.enable = true;
}
