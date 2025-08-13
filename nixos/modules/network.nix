{ lib, ... }: {
  services.resolved.enable = lib.mkForce false;
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;
}
