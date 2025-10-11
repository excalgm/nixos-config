{ pkgs, ... }: {
  programs.niri = {
    enable = true;
    package = pkgs.niri-stable;
  };
  services.displayManager.ly.enable = true;
}