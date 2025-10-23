{
  programs = {
    btop.enable = true;
    bat.enable = true;
    lsd.enable = true;
    obs-studio.enable = true;

    fuzzel = {
      enable = true;
      settings = {
        main = {
          placeholder = "Enter something...";
          prompt = "🔍 ";
          terminal = "kitty --hold";
          lines = 15;
          line-height = 20;
          inner-pad = 5;
          width = 50;
          horizontal-pad = 20;
        };
      };
    };

    iamb = {
      enable = true;
      settings = {
        profiles.user.user_id = "@stanislav:excal.cc";
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

  services.mako = {
    enable = true;
    settings = {
      on-button-middle = "dismiss-all";
      default-timeout = 2500;
      max-icon-size = 48;
      "mode=do-not-disturb".invisible = true;
      "app-name=wp-vol" = {
        layer = "overlay";
        history = false;
        anchor = "top-center";
        group-by = "app-name";
        format = "<b>%s</b>\\n%b";
      };
      "app-name=wp-vol group-index=0".invisible = false;
    };
  };
}
