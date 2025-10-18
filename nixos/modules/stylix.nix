{ pkgs, ... }: {
  stylix = {
    enable = true;
    autoEnable = false;

    image = ../../assets/wallpaper.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";

    targets.qt.enable = true;
  };
}
