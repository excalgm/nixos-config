{ user, ... }: {
  home-manager.users.${user}.programs.niri.settings.outputs = {
    "HDMI-A-1" = {
      mode = { width=1920; height=1080; refresh=75.0; };
      scale = 1.00;
    };
  };
}
