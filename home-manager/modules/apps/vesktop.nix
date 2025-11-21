{ config, ... }: {
  programs.vesktop = {
    enable = true;
    settings = {
      appBadge = false;
      arRPC = true;
      checkUpdates = false;
      customTitleBar = true;
      minimizeToTray = true;
      tray = true;
      staticTitle = true;
      hardwareAcceleration = true;
      discordBranch = "stable";
    };
    vencord.themes.matugen = builtins.readFile "${config.programs.matugen.theme.files}/.config/vesktop/themes/midnight-discord.css";
    vencord.settings.enabledThemes = [ "matugen.css" ];
  };
}
