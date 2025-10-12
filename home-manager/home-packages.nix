{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # Desktop apps
    filen-desktop
    keepassxc
    localsend
    telegram-desktop
    vlc
    yandex-music

    # Console utilities
    cava
    cbonsai
    cmatrix
    lutgen
    wget

    # Console utilities -> Dependencies for other apps
    brightnessctl
    libnotify
    wl-clipboard
    wtype

    # Other
    bemoji
    udiskie
  ];
}
