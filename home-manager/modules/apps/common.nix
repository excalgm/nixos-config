{ config, ... }: {
  programs = {
    bat.enable = true;
    lsd.enable = true;

    btop = {
      enable = true;
      themes.matugen = builtins.readFile "${config.programs.matugen.theme.files}/.config/btop/themes/matugen.theme";
      settings = {
        color_theme = "matugen";
        theme_background = false;
      };
    };

    fuzzel = {
      enable = true;
      settings = {
        main = {
          launch-prefix = "uwsm-app --";
          placeholder = "Enter something...";
          prompt = "🔍 ";
          terminal = "kitty --hold";
          lines = 15;
          line-height = 20;
          inner-pad = 5;
          width = 50;
          horizontal-pad = 20;
          include = "${config.programs.matugen.theme.files}/.config/fuzzel/colors.ini";
        };
        border.width = 2;
        border.radius = 8;
      };
    };

    iamb = {
      enable = true;
      settings = {
        profiles.user.user_id = "@excalgm:mozilla.org";
        notifications.enabled = true;
        image_preview = {
          protocol.type = "kitty"; 
          protocol.size = {
            height = 10;
            width = 66;
          };
        };
      };
    };
  };

  services.dunst = {
    enable = true;
    configFile = "${config.programs.matugen.theme.files}/.config/dunst/dunstrc";
  };
}
