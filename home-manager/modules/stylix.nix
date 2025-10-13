{ pkgs, inputs, config, ... }: {
  imports = [ inputs.stylix.homeModules.stylix ];

  home.packages = with pkgs; [
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
  ];

  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    # You can use lutgen to apply color palette to wallpaper:
    # https://github.com/ozwaldorf/lutgen-rs
    image = ../../assets/wallpaper.jpg;
    # https://nix-community.github.io/stylix/configuration.html#handmade-schemes
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";

    fonts = {
      serif = config.stylix.fonts.monospace; 
      sansSerif = config.stylix.fonts.monospace; 
      monospace = {
        name = "JetBrainsMono Nerd Font Mono";
        package = pkgs.nerd-fonts.jetbrains-mono;
      };
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
      sizes = {
        applications = 12;
        desktop = 14;
        popups = 12;
        terminal = 11;
      };
    };

    cursor = {
      name = "Bibata-Modern-Classic";
      size = 24;
      package = pkgs.bibata-cursors;
    };

    iconTheme = {
      enable = true;
      package = pkgs.morewaita-icon-theme;
      dark = "MoreWaita";
      light = "MoreWaita";
    };

    targets = {
      firefox = {
        firefoxGnomeTheme.enable = false;
        profileNames = [ "default" ];
      };
      hyprlock.enable = false;
      vscode.enable = true;
      waybar.enable = false;
    };
  };
}
