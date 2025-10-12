{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gnome-software
  ];
}
