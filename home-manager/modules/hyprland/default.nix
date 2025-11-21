{ config, ... }: {
  imports = [
    ./binds.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./windows.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      enableXdgAutostart = true;
    };

    settings = {
      source = [
        "${config.programs.matugen.theme.files}/.config/hypr/colors.conf"
      ];

      "$mainMod" = "SUPER";
      "$terminal" = "uwsm-app -- kitty";
      "$fileManager" = "uwsm-app -- nautilus --new-window";
      "$menu" = "uwsm-app -- fuzzel";

      general = {
        gaps_in = 1;
        gaps_out = 1;
        border_size = 2;

        "col.active_border" = "$primary $secondary 45deg";
        "col.inactive_border" = "$outline_variant";

        resize_on_border = true;
        layout = "dwindle";
      };

      decoration = {
        rounding = 8;
        rounding_power = 2;

        shadow.enabled = false;
      };

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:win_space_toggle";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad.natural_scroll = true;
      };

      gesture = [
        "3, horizontal, workspace"
      ];

      animations.enabled = false;
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
    };
  };
}
