{ user, ... }: {
  home-manager.users.${user}.wayland.windowManager.hyprland.settings.monitor = [
    "HDMI-A-1,preferred,auto,1.00"
  ];
}
