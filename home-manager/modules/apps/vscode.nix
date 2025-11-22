{ config, pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        bierner.emojisense
        ms-python.flake8
        ms-python.python
        ms-python.vscode-pylance
        oops418.nix-env-picker
        pkief.material-icon-theme
        pkief.material-product-icons
        usernamehw.errorlens
        vscodevim.vim
        wakatime.vscode-wakatime
        ];
      userSettings = {
        "editor.tabSize" = 2;
        "workbench.colorTheme" = "HyprLuna Material";
        "workbench.productIconTheme" = "material-product-icons";
        "workbench.iconTheme" = "material-icon-theme";
        "extensions.autoCheckUpdates" = false;
        "extensions.autoUpdate" = false;
        "vsicons.dontShowNewVersionMessage" = true;
        "git.autofetch" = true;
        "git.confirmSync" = false;
      };
    };
  };
  home.file.".vscode/extensions/hyprluna.hyprluna-theme-1.0.2/themes/hyprluna.json" = {
    source = "${config.programs.matugen.theme.files}/.vscode/hyprluna.json";
    force = true;
  };
}
