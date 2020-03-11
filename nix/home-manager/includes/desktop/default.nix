{ pkgs, ... }:

let theme = (import ./themes/brewer.nix).theme;
in {
  home.packages = (with pkgs; [
    arc-icon-theme
    arc-theme
    bibata-cursors-translucent
    gnome3.gnome-tweaks
  ]);

  gtk = {
    enable = true;

    font = {
      name = "Cascadia Code 11";
    };

    theme = {
      name = "Nordic-blue";
    };

    iconTheme = {
      name = "Arc";
    };
  };
}
