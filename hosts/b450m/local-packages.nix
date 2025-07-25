{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		wget
		vim
		ntfs3g
	];
}
