{ pkgs, ... }: {
  #  home.packages = with pkgs; [
  #    noto-fonts-color-emoji
  #    nerd-fonts.jetbrains-mono
  #  ];

  stylix = {
    enable = true;
    autoEnable = true;

    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

    targets = {
      zen-browser = {
        profileNames = [ "default" ];
      };
      hyprlock.enable = false;
      kde.enable = false;
      qt.enable = true;
      vscode.enable = true;
      waybar.enable = false;
    };
  };
}
