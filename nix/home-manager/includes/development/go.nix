{ config, pkgs, ... }:

{
  programs.go = {
    enable = true;
    goPath = "./Code";
  };
}
