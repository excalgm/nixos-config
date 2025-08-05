{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
  services.gnome.gnome-browser-connector.enable = true;
  services.udev.packages = [ pkgs.gnome-settings-daemon ];
  environment.gnome.excludePackages = with pkgs; [
    gnome-calendar
    gnome-characters
    gnome-clocks
    gnome-connections
    gnome-console
    gnome-contacts
    gnome-logs
    gnome-maps
    gnome-music
    gnome-weather
    decibels 		# Audio player
    epiphany 		# Browser
    evince 			# Document viewer
    geary 			# E-mail
    seahorse    # Password manager
    simple-scan # Document scanner
    snapshot 		# Camera
    totem 			# Video player
    yelp 				# Help
  ];
}
