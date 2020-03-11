{ config, pkgs, ... }:

{
  home.packages = (with pkgs; [
    alacritty
    termite
  ]);

  programs.kitty = {
    enable = true;

    font.name = "Cascadia Code";

    settings = {
      bold_font        = "auto";
      italic_font      = "auto";
      bold_italic_font = "auto";

      font_size = "14.0";

      scrollback_lines = "10000";

      background_opacity = "0.8";
    };

    keybindings = {
      "ctrl+insert" = "copy_to_clipboard";
      "shift+insert" =    "paste_from_clipboard";

      "ctrl+enter"  =       "new_window";
      "ctrl+backspace"  =   "close_window";
      "ctrl+delete"  =      "close_window";
      "ctrl+pagedown"  =    "next_window";
      "ctrl+pageup"  =      "previous_window";

      "ctrl+f" =           "goto_layout stack";
      "ctrl+escape" =      "last_used_layout";

      "alt+enter" =         "new_tab";
      "alt+backspace" =     "close_tab";
      "alt+delete" =        "close_tab";
      "alt+pagedown" =      "next_tab";
      "alt+pageup" =        "previous_tab";
    };
  };
}
