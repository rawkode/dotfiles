{ config, pkgs, ... }:

with pkgs;
{
  home.packages = (with pkgs; [
    obs-studio
    shotcut
  ]);
}
