{ lib, pkgs, ... }:

let
  modifier = "Mod4";
  theme = (import ./themes/brewer.nix).theme;
in {
  home.packages = (with pkgs; [
    compton
    dunst
    i3lock
    nitrogen
    pasystray
    pavucontrol
  ]);

  xresources.properties = {
    "Xft.antialias" = 1;
    "Xft.autohint" = 0;
    "Xft.hinting" = 1;
    "Xft.hintstyle" = "hintfull";
    "Xft.lcdfilter" = "lcddefault";

    "Xcursor.theme" = "Bibata Oil";

    "*.foreground"  = theme.foreground;
    "*.background"  = theme.background;
    "*.cursorColor" = theme.cursorColor;
    "*.color0"      = theme.color0;
    "*.color8"      = theme.color8;
    "*.color1"      = theme.color1;
    "*.color9"      = theme.color9;
    "*.color2"      = theme.color2;
    "*.color10"     = theme.color10;
    "*.color3"      = theme.color3;
    "*.color11"     = theme.color11;
    "*.color4"      = theme.color4;
    "*.color12"     = theme.color12;
    "*.color5"      = theme.color5;
    "*.color13"     = theme.color13;
    "*.color6"      = theme.color6;
    "*.color14"     = theme.color14;
    "*.color7"      = theme.color7;
    "*.color15"     = theme.color15;
  };

  programs = {
    urxvt = {
      enable = true;
      fonts = [
        "xft:FuraCode Nerd Font:size=11"
      ];
    };
  };

  xsession = {
    enable = true;

    windowManager.i3 = {
      enable = true;

      config = {
        window = {
          titlebar = true;
        };

        fonts = [
          "FuraCode Nerd Font 9"
        ];

        modifier = modifier;

        bars = [];

        focus = {
          followMouse = false;
          newWindow = "smart";
        };

        colors = {
          background = theme.background;

          focused = {
            border = "$color4";
            background = "$color4";
            text = "$color15";
            indicator = "$color4";
            childBorder = "$color4";
          };

          unfocused = {
            border = "$background";
            background = "$background";
            text = "$foreground";
            indicator = "$background";
            childBorder = "$background";
          };

          focusedInactive = {
            border = "$color0";
            background = "$background";
            text = "$foreground";
            indicator = "$color2";
            childBorder = "$background";
          };

          placeholder = {
            border = "$color0";
            background = "$background";
            text = "$foreground";
            indicator = "$color2";
            childBorder = "$background";
          };

          urgent = {
            border = "$color0";
            background = "$background";
            text = "$color15";
            indicator = "$color1";
            childBorder = "$background";
          };
        };

        gaps = {
          inner = 8;
          outer = 8;

          smartBorders = "on";
        };

        keybindings =
          lib.mkOptionDefault {
            "${modifier}+Shift+e" = "exec --no-startup-id i3-msg exit";
            "${modifier}+Pause" = "exec --no-startup-id i3-msg exit";
            "${modifier}+l" = "exec i3lock --color '${theme.background}'";
            "Pause" = "exec i3lock --color '${theme.background}'";


            "${modifier}+1" = "workspace 1";
            "${modifier}+2" = "workspace 2";
            "${modifier}+3" = "workspace 3";
            "${modifier}+4" = "workspace 4";
            "${modifier}+5" = "workspace 5";
            "${modifier}+6" = "workspace 6";
            "${modifier}+7" = "workspace 7";
            "${modifier}+8" = "workspace 8";
            "${modifier}+9" = "workspace 9";
            "${modifier}+0" = "workspace 10";

            "${modifier}+Shift+1" = "move container to workspace 1";
            "${modifier}+Shift+2" = "move container to workspace 2";
            "${modifier}+Shift+3" = "move container to workspace 3";
            "${modifier}+Shift+4" = "move container to workspace 4";
            "${modifier}+Shift+5" = "move container to workspace 5";
            "${modifier}+Shift+6" = "move container to workspace 6";
            "${modifier}+Shift+7" = "move container to workspace 7";
            "${modifier}+Shift+8" = "move container to workspace 8";
            "${modifier}+Shift+9" = "move container to workspace 9";
            "${modifier}+Shift+0" = "move container to workspace 10";

            "${modifier}+Up" = "focus up";
            "${modifier}+Right" = "focus right";
            "${modifier}+Left" = "focus left";
            "${modifier}+Down" = "focus down";

            "${modifier}+Shift+Up" = "move up";
            "${modifier}+Shift+Right" = "move down";
            "${modifier}+Shift+Left" = "move left";
            "${modifier}+Shift+Down" = "move down";

            "${modifier}+Prior" = "workspace prev";
            "${modifier}+Next" = "workspace next";

            "${modifier}+h" = "split h";
            "${modifier}+v" = "split v";

            "${modifier}+f" = "fullscreen";

            "${modifier}+s" = "layout stacking";
            "${modifier}+w" = "layout tabbed";
            "${modifier}+e" = "layout toggle split";

            "${modifier}+Shift+space" = "floating toggle";
            "${modifier}+a" = "focus parent";

            "${modifier}+minus" = "scratchpad show";
            "${modifier}+Shift+minus" = "move scratchpad";

            "${modifier}+Shift+c" = "reload";
            "${modifier}+Shift+r" = "restart";

            # Restart Polybar when systray crashes
            "${modifier}+p" = "exec --no-startup-id polybar-msg cmd restart";
            # Fix Bluetooth after a sleep / suspend
            "${modifier}+b" = "exec --no-startup-id systemctl --user daemon-reload && systemctl --user restart pulseaudio";

            "${modifier}+q" = "kill";
            "${modifier}+r" = "mode \"resize\"";

            "XF86AudioRaiseVolume" = "exec  --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ false && pactl set-sink-volume @DEFAULT_SINK@ +5% && V=`pamixer --get-volume` && notify-send \"Raising Volume to \${V}%\"";

            "XF86AudioLowerVolume" = "exec  --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ false && pactl set-sink-volume @DEFAULT_SINK@ -5% && V=`pamixer --get-volume` && notify-send \"Lowering Volume to \${V}%\"";

            "${modifier}+Return" = "exec  --no-startup-id termite";

            "${modifier}+space" = "exec --no-startup-id rofi -show drun";
            "${modifier}+Home" = "exec --no-startup-id rofi -show drun";

            "${modifier}+End" = "exec --no-startup-id rofi -show window";
            "Control+Down" = "exec --no-startup-id rofi -show window";

            "Print" = "exec --no-startup-id flameshot gui";
          };

        modes = {
          resize = {
            Up = "resize grow height 10 px or 10 ppt";
            Right = "resize shrink width 10 px or 10 ppt";
            Down = "resize shrink height 10 px or 10 ppt";
            Left = "resize grow width 10 px or 10 ppt";
            Return = "mode \"default\"";
            Escape = "mode \"default\"";
          };
        };

        startup = [
          {
            command = "compton";
            notification = false;
          }
          {
            command = "polybar top";
            notification = false;
          }
          {
            command = "nitrogen --restore";
            notification = false;
          }
          {
            command = "nm-applet";
            notification = false;
          }
          {
            command = "setxkbmap us -variant altgr-intl";
            notification = false;
          }
        ];
        window.commands = [];
      };

      extraConfig = ''
        # Colors set from ~/.Xresources
        set_from_resource	$background	background
        set_from_resource	$foreground	foreground
        set_from_resource	$color0		color0
        set_from_resource $color1 	color1
        set_from_resource $color2 	color2
        set_from_resource $color3 	color3
        set_from_resource $color4 	color4
        set_from_resource $color5 	color5
        set_from_resource $color6		color6
        set_from_resource	$color7		color7
        set_from_resource	$color8		color8
        set_from_resource	$color9		color9
        set_from_resource	$color10	color10
        set_from_resource	$color11	color11
        set_from_resource	$color12	color12
        set_from_resource	$color13	color13
        set_from_resource	$color14	color14
        set_from_resource	$color15	color15

        assign [class="Chromium"] 1
        assign [class="Google-chrome"] 1
        assign [class="Code"] 2
        assign [class="Wavebox"] 10
        assign [class="Slack"] 10
        assign [class="Signal"] 10
      '';
    };
  };

services = {
    pasystray.enable = true;

    compton = {
      enable = true;
      blur = true;
      shadow = true;

      # This rule stops other windows on the same workspace being
      # the "background" when stacked or tabbed.
      opacityRule = [
        "95:class_g = 'URxvt' && !_NET_WM_STATE@:32a"
        "0:_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
      ];
    };

    dunst = {
      enable = true;

      settings = {
        frame = {
          width = 2;
          color = theme.color4;
        };

        global = {
          geometry = "300x5+50-20";

          transparency = 20;

          padding = 8;
          horizontal_padding = 8;

          line_height = 0;

          separator_color = "frame";

          markup = "full";
          alignment = "left";
          word_wrap = "true";
        };

        shortcuts = {
          close = "ctrl+Escape";
          close_all = "ctrl+shift+Escape";
        };

        urgency_low = {
          timeout = 4;

          foreground = theme.foreground;
          background = theme.color0;
        };

        urgency_normal = {
          timeout = 8;

          foreground = theme.foreground;
          background = theme.color0;
        };

        urgency_critical = {
          timeout = 0;

          foreground = theme.color15;
          background = theme.color1;
        };
      };
    };

    polybar = {
      enable = true;

      package = pkgs.polybar.override {
        i3GapsSupport = true;
        alsaSupport = true;
      };

      script = '''';

      config = {
        "bar/top" = {
          enable-ipc = true;

          width = "100%";
          #bottom = true;
          height = "32";
          radius = 0;
          fixed-center = true;
          underline-size = 4;
          underline-color = theme.color6;

          spacing = 0;
          module-margin = 0;
          module-padding = 0;
          border-top-size = 0;
          border-bottom-size = 0;
          border-right-size = 0;
          border-left-size = 0;

          background = theme.background;
          foreground = theme.foreground;

          font-0 = "FuraCode NerdFont:size=11";
          font-1 = "Noto Color Emoji:scale=11";
          font-2 = "Font Awesome 5 Free:style=Solid:size=10;1";
          font-3 = "Font Awesome 5 Brands:size=10;1";

          modules-left = "i3 xwindow";
          modules-center = "time date";
          modules-right = "wlan volume battery";

          tray-position = "right";
          tray-padding = 16;
          tray-offset-x = 0;

          tray-transparent = false;
          tray-background = theme.background;

          cursor-click = "pointer";
          cursor-scroll = "ns-resize";
        };

        "module/xwindow" = {
          type = "internal/xwindow";

          label = "  %title:0:35:...%";
          label-padding = 2;

          format-spacing = 8;
          format-background = theme.color6;
          format-foreground = theme.background;
        };

        "module/i3" = {
          type = "internal/i3";

          index-sort = true;
          wrapping-scroll = false;
          pin-workspaces = false;

          format = "<label-state> <label-mode>";

          label-mode-padding = 2;
          label-mode-foreground = theme.foreground;
          label-mode-background = theme.background;

          label-focused = "%index%";
          label-focused-background = theme.color6;
          label-focused-foreground = theme.background;
          label-focused-underline = theme.color6;
          label-focused-padding = 2;

          label-unfocused = "%index%";
          label-unfocused-background = theme.background;
          label-unfocused-foreground = theme.color8;
          label-unfocused-underline = theme.color6;
          label-unfocused-padding = 2;

          label-visible = "%index%";
          label-visible-background = theme.background;
          label-visible-foreground = theme.color8;
          label-visible-underline = theme.color6;
          label-visible-padding = 2;

          label-urgent = "%index%";
          label-urgent-background = theme.color1;
          label-urgent-foreground = theme.color15;
          label-urgent-underline = theme.color6;
          label-urgent-padding = 2;
        };

        "module/time" = {
          type = "internal/date";

          format-background = theme.background;
          format-foreground = theme.color5;

          label = "  %time%  ";

          time = " %H:%M    ";
        };

        "module/date" = {
          type = "internal/date";

          format-background = theme.background;
          format-foreground = theme.color2;

          label = "  %date%  ";

          date = "    %A, %e %B ";
        };


        "module/battery" = {
          type = "internal/battery";

          full-at = 99;

          battery = "BAT0";
          adapter = "AC0";

          poll-interval = 5;

          label-charging = "%percentage%";
          format-charging = "<animation-charging>  <label-charging>";
          format-charging-background = theme.color4;
          format-charging-padding = 4;

          label-discharging = "%percentage%";
          format-discharging = "<ramp-capacity>  <label-discharging>";
          format-discharging-background = theme.color3;
          format-discharging-padding = 4;

          label-full = "%percentage%";
          format-full = "<ramp-capacity>  <label-full>";
          format-full-background = theme.color2;
          format-full-padding = 4;

          ramp-capacity-0 = "";
          ramp-capacity-1 = "";
          ramp-capacity-2 = "";
          ramp-capacity-3 = "";
          ramp-capacity-4 = "";

          animation-discharging-0 = "";
          animation-discharging-1 = "";
          animation-discharging-2 = "";
          animation-discharging-3 = "";
          animation-discharging-4 = "";
          animation-discharging-framerate = 750;

          animation-charging-0 = "";
          animation-charging-1 = "";
          animation-charging-2 = "";
          animation-charging-3 = "";
          animation-charging-4 = "";
          animation-charging-framerate = 750;
        };

        "module/backlight" = {
          type = "internal/backlight";

          card = "intel_backlight";
          enable-scroll = true;

          format = "<ramp> <label>";
          label = "%percentage%";

          ramp-0 = "🌕";
          ramp-1 = "🌔";
          ramp-2 = "🌓";
          ramp-3 = "🌒";
          ramp-4 = "🌑";
        };

        "module/volume" = {
          type = "internal/alsa";

          label-volume = "%percentage%";

          format-volume = "<ramp-volume> <label-volume>";
          format-volume-foreground = theme.foreground;
          format-volume-background = theme.color5;
          format-volume-padding = 2;

          label-muted = " muted";
          label-muted-foreground = theme.color15;

          format-muted = "<label-muted>";
          format-muted-background = theme.color8;
          format-muted-padding = 2;

          ramp-volume-0 = "";
          ramp-volume-1 = "";
          ramp-volume-2 = "";
          ramp-headphones-0 = "";
        };

        "module/wlan" = {
          type = "internal/network";

          interface = "wlp2s0";

          interval = 5;

          label-connected = " %essid%";
          label-connected-background = theme.color2;
          label-connected-foreground = theme.foreground;
          label-connected-padding = 2;

          label-disconnected = " Not Connected";
          label-disconnected-background = theme.background;
          label-disconnected-foreground = theme.foreground;
          label-disconnected-padding = 2;
        };

        settings = {
          screenchange-reload = true;
        };

        "global/wm" = {
          margin-top = 5;
          margin-bottom = 5;
        };
      };
    };
  };
}
