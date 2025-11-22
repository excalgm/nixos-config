{ inputs, ... }: let
  templates = ./templates;
  wallpaper = ../../../assets/wallpaper.png;
in {
  imports = [
    inputs.matugen.nixosModules.default
    ./gtkstyling.nix
    ./qtstyling.nix
  ];
  programs.matugen = {
    enable = true;
    variant = "dark";
    jsonFormat = "hex";
    inherit wallpaper;

    templates = {
      waybar = {
        input_path = "${templates}/colors.css";
        output_path = "~/.config/waybar/colors.css";
      };
      kitty = {
        input_path = "${templates}/kitty.conf";
        output_path = "~/.config/kitty/colors.conf";
      };
      fuzzel = {
        input_path = "${templates}/fuzzel.ini";
        output_path = "~/.config/fuzzel/colors.ini";
      };
      zenUserChrome = {
        input_path = "${templates}/userChrome.css.tpl";
        output_path = "~/.config/zen/userChrome.css";
      };
      zenUserContent = {
        input_path = "${templates}/userContent.css.tpl";
        output_path = "~/.config/zen/userContent.css";
      };
      hyprland = {
        input_path = "${templates}/hyprland.conf";
        output_path = "~/.config/hypr/colors.conf";
      };
      qtct = {
        input_path = "${templates}/qtct.conf";
        output_path = "~/.config/qt5ct/colors/matugen.conf";
      };
      dunst = {
        input_path = "${templates}/dunst";
        output_path = "~/.config/dunst/dunstrc";
      };
      gtk = {
        input_path = "${templates}/gtk.css";
        output_path = "~/.config/gtk-3.0/gtk.css";
      };
      vesktop = {
        input_path = "${templates}/discord.css";
        output_path = "~/.config/vesktop/themes/midnight-discord.css";
      };
      btop = {
        input_path = "${templates}/btop.theme";
        output_path = "~/.config/btop/themes/matugen.theme";
      };
    };
  };

  services.wpaperd.settings.any.path = wallpaper;
}
