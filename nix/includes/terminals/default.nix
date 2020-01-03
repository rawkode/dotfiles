{ config, pkgs, ... }:

{
  home.packages = (with pkgs; [
    alacritty
    kitty
    termite
  ]);
}
