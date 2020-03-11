{ ... }:

let
  theme = (import ./themes/brewer.nix).theme;
in {
  programs.rofi = {
    enable = true;

    lines = 3;
    location = "center";
    width = 70;

    padding = 16;
    borderWidth = 4;

    colors = {
      window = {
        background = theme.background;
        border = theme.color5;
        separator = theme.color5;
      };

      rows = {
        normal = {
          background = theme.background;
          backgroundAlt = theme.background;
          foreground = theme.color8;

          highlight = {
            background = theme.color2;
            foreground = theme.foreground;
          };
        };

        urgent = {
          background = theme.color1;
          foreground = theme.color1;

          backgroundAlt = theme.color2;

          highlight = {
            background = theme.color1;
            foreground = theme.color1;
          };
        };

        active = {
          background = theme.color6;
          foreground = theme.color15;

          backgroundAlt = theme.color1;

          highlight = {
            background = theme.color6;
            foreground = theme.color3;
          };
        };
      };
    };

    separator = "solid";
  };
}
