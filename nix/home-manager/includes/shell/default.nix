{ config, pkgs, ... }:

{
  home.packages = (with pkgs; [
    bat
    direnv
    exa
    fzf
    ripgrep
    skim
    tldr
    unzip
    vim
    wget
    zsh
  ]);

  programs.direnv.enable = true;
  programs.ssh.enable = true;
}
