{ pkgs, ... }: let ge = pkgs.gnomeExtensions; in {
	programs.gnome-shell = {
		enable = true;
		extensions = [
			{ package = ge.accent-directories; }
			{ package = ge.appindicator; }
			{ package = ge.caffeine; }
			{ package = ge.dash-to-dock; }
			{ package = ge.window-is-ready-remover; }
		];
	};
	dconf = {
		enable = true;
		settings."org/gnome/desktop/wm/preferences".button-layout = ":minimize,maximize,close";
	};
}
