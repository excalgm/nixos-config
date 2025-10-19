{
  #  home.packages = with pkgs; [
  #    noto-fonts-color-emoji
  #    nerd-fonts.jetbrains-mono
  #  ];

  stylix = {
    enable = true;
    autoEnable = true;

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
