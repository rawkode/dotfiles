{ config, pkgs, ... }:

{
  home.packages = (with pkgs; [
    fuse
    gnupg
    kbfs
    keybase
    pinentry-gnome
  ]);

  services = {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
      extraConfig = ''
        pinentry-program ${pkgs.pinentry-gnome}/bin/pinentry-gnome3
      '';
    };

    keybase = {
      enable = true;
    };
      
    kbfs = {
      enable = true;
      mountPoint = "Keybase";
    };
  };
}
