{ config, ... }: {
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    settings = {
      hide_window_decorations = "no";
    };
    extraConfig = ''
      ${builtins.readFile "${config.programs.matugen.theme.files}/.config/kitty/colors.conf"}
    '';
  };
}
