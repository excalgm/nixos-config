{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # Desktop apps
    appflowy
    figma-agent
    filen-desktop
    keepassxc
    localsend
    telegram-desktop
    yandex-music

    # Console utilities
    wget
    lutgen
  ];
}
