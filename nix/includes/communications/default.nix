{ config, pkgs, ... }:

{
  home.packages = (with pkgs; [
    discord
    slack
    zoom-us
  ]);
}
