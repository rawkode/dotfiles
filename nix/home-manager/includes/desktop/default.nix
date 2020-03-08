{ pkgs, ... }:

let theme = (import ./themes/brewer.nix).theme;
in {
  imports =
  [
    ./i3.nix
    ./rofi.nix
  ];

  home.packages = (with pkgs; [
    arc-icon-theme
    arc-theme
    bibata-cursors
    gnome3.gnome-tweaks
    materia-theme
  ]);

  gtk = {
    enable = true;

    font = {
      name = "Cascadia Code 11";
    };

    theme = {
      name = "Arc-Darker";
    };

    iconTheme = {
      name = "Arc";
    };
  };
}
