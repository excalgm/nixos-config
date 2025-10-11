{ pkgs, ... }: {
  boot.loader.systemd-boot = {
    enable = true;
    editor = false;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_lqx;
  boot.supportedFilesystems = [ "ntfs" ];
}
