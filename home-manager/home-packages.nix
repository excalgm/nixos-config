{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Desktop apps
    filen-desktop
    keepassxc
    localsend
    nautilus
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
    hyprshot
    pipes-rs
    wf-recorder
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
