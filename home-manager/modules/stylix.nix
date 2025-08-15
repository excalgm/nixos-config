{ pkgs, inputs, ... }: {
  imports = [ inputs.stylix.homeModules.stylix ];

  home.packages = with pkgs; [
    noto-fonts-emoji
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
    base16Scheme = "${pkgs.base16-schemes}/share/themes/windows-10.yaml";

    fonts = {
      monospace = {
        name = "JetBrainsMono Nerd Font Mono";
        package = pkgs.nerd-fonts.jetbrains-mono;
      };
      sizes.terminal = 12;
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
        firefoxGnomeTheme.enable = true;
        profileNames = [ "default" ];
      };
      vscode.enable = true;
    };
  };
}
