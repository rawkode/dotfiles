{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nerdfonts
  ];


  fonts.enableCoreFonts = true;
  fonts.fonts = [
    pkgs.noto-fonts
    pkgs.google-fonts
  ];
}
