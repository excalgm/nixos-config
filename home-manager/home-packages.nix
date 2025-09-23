{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # Desktop apps
    appflowy
    filen-desktop
    keepassxc
    localsend
    telegram-desktop
    vlc

    # Console utilities
    wget
    lutgen
  ];
}
