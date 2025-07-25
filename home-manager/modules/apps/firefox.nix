{ pkgs, ... }: {
	programs.firefox = {
		enable = true;
		package = pkgs.firefox.override {
			nativeMessagingHosts = [ pkgs.gnome-browser-connector ];
		};
		profiles.default = {
			isDefault = true;
		};
	};
}
