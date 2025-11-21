{ user, ... }: {
  home-manager.users.${user}.wayland.windowManager.hyprland.settings.monitor = [
    "eDP-1,preferred,auto,1.20"
  ];
}
