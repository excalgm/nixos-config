{
  services.mako = {
    enable = true;
    settings = {
#      font = "JetBrainsMono Nerd Font";
      on-button-middle = "dismiss-all";
      default-timeout = 2500;
      max-icon-size = 48;

#      background-color = "#282828";
#      text-color = "#ebdbb2";
#      border-color = "#665c54";
#      progress-color = "over #504945";

#      "urgency=high".border-color = "#cc241d";
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
