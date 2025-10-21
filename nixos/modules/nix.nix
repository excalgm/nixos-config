{ user, ... }: {
  programs.nh = {
    enable = true;
    flake = "/home/${user}/nixos-config";
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
