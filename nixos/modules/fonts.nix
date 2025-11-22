{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    rubik
    noto-fonts
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = [ "Noto Color Emoji" ];
      monospace = [ "JetBrainsMono Nerd Font Mono" ];
      serif = [ "Rubik Medium" "Noto Serif" ];
      sansSerif = [ "Rubik Medium" "Noto Sans" ];
    };
  };
}
