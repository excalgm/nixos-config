{ pkgs, ... }: {
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.elisa
    kdePackages.konsole
  ];

  environment.systemPackages = with pkgs; [
    kdePackages.discover
    kdePackages.kcalc
    kdePackages.kcharselect
    kdePackages.kclock
    kdePackages.kcolorchooser
    kdePackages.kolourpaint
    kdePackages.ksshaskpass
    kdePackages.sddm-kcm
    kdePackages.partitionmanager

    wayland-utils
    wl-clipboard
  ];
}