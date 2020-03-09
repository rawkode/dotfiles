{ config, pkgs, ... }:

{
  home.packages = (with pkgs; [
    awscli
  ]);
}
