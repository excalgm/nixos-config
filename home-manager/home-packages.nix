{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
		# Desktop apps
    filen-desktop
    keepassxc
    localsend
    telegram-desktop
    amnezia-vpn

    # Console utilities
    wget
    lutgen
	];
}
