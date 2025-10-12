{
  imports = [
    ./binds.nix
  ];

  programs.niri = {
    enable = true;
    settings = {
      prefer-no-csd = true;
      spawn-at-startup = [
        { argv = ["udiskie" "--tray"]; }
        { argv = ["mako"]; }
        { argv = ["waybar"]; }
        { argv = ["systemctl" "--user" "restart" "wpaperd.service"]; }
        # { argv = ["hypridle"]; }
      ];

      environment = {
        "NIXOS_OZONE_WL" = "1";
      };

      input = {
        keyboard.xkb = {
          layout = "us,ru";
          options = "grp:win_space_toggle,grp:alt_shift_toggle";
        };

        touchpad = {
          tap = true;
          natural-scroll = true;
          dwt = true;
          scroll-method = "two-finger";
          disabled-on-external-mouse = true;
        };

        mouse = {
          accel-profile = "flat";
        };

        focus-follows-mouse.enable = true;
        warp-mouse-to-focus.enable = true;
      };

      outputs = {
        "eDP-1" = {
          mode = { width=1920; height=1080; refresh=60.0; }; 
          scale = 1.10;
        };
      };

      clipboard = {
        disable-primary = true;
      };

      hotkey-overlay = {
        skip-at-startup = true;
      };

      gestures.hot-corners.enable = false;

      layout = {
        gaps = 7;
        center-focused-column = "on-overflow";
        background-color = "#282828";

        preset-column-widths = [
          { proportion = 1. / 3.; }
          { proportion = 1. / 2.; }
          { proportion = 2. / 3.; }
        ];

        focus-ring.enable = false;

        border = {
          width = 2;
          active = { color = "#665c54"; };
          inactive = { color = "#1d2021"; };
          urgent = { color = "#cc241d"; };
        };

        shadow = {
          enable = true;
          softness = 30;
          spread = 9;
          offset = {
            x = 0;
            y = 5;
          };
          color = "#0007";
        };
      };

      screenshot-path = "~/Pictures/Screenshots/Screenshot_%Y-%m-%d_%H-%M-%S.png";

      animations = {
        window-open.kind = {
          easing = {
            duration-ms = 300;
            curve = "ease-out-cubic";
          };
        };

        window-close.kind = {
          easing = {
            duration-ms = 300;
            curve = "ease-out-cubic";
          };
        };

        window-movement.kind = {
          spring = {
            damping-ratio = 1.0;
            stiffness = 800;
            epsilon = 0.0001;
          };
        };

        workspace-switch.kind = {
          spring = {
            damping-ratio = 1.0;
            stiffness = 500;
            epsilon = 0.0001;
          };
        };

        config-notification-open-close.kind = {
          spring = {
            damping-ratio = 0.6;
            stiffness = 500;
            epsilon = 0.0001;
          };
        };
      };

      window-rules = [
        {
          matches = [
            { app-id = "firefox$"; title="^Picture-in-Picture$"; }
          ];
          open-floating = true;
        }
        {
          geometry-corner-radius = {
            top-left=9.0; top-right=9.0; bottom-left=9.0; bottom-right=9.0;
          };
          clip-to-geometry = true;
        }
      ];
    };
  };
}
