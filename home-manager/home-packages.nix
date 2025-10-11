{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # Desktop apps
    filen-desktop
    keepassxc
    localsend
    telegram-desktop
    vlc

    # Console utilities
    brightnessctl
    libnotify
    lutgen
    wget

    # Other
    bemoji
    udiskie
  ];
}
