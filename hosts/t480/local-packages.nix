{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		vim
		gnome-software
	];
}
