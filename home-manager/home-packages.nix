{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Desktop apps
    filen-desktop
    keepassxc
    localsend
    telegram-desktop
    vlc
    yandex-music

    # Office + SpellCheck
    libreoffice-still
    hunspell
    hunspellDicts.ru_RU
    hunspellDicts.en_US

    # Console utilities
    cava
    cbonsai
    cmatrix
    lutgen
    pipes-rs
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
