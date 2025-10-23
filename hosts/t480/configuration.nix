{ stateVersion, hostname, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./local-packages.nix
    ../../nixos/modules

    ./tailscale.nix
  ];

  #  environment.systemPackages = [ pkgs.home-manager ];

  networking.hostName = hostname;

  system.stateVersion = stateVersion;

  services.power-profiles-daemon.enable = true;
  services.fwupd.enable = true;
  services.throttled.enable = true;
  services.fstrim.enable = true;
}
