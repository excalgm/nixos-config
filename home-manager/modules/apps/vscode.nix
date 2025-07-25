{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        bierner.emojisense
        ms-python.flake8
        ms-python.python
        ms-python.vscode-pylance
        oops418.nix-env-picker
        pkief.material-product-icons
        usernamehw.errorlens
        vscode-icons-team.vscode-icons
        vscodevim.vim
        wakatime.vscode-wakatime
        ];
      userSettings = {
        "editor.tabSize" = 2;
        "workbench.productIconTheme" = "material-product-icons";
        "workbench.iconTheme" = "vscode-icons";
        "extensions.autoCheckUpdates" = false;
        "extensions.autoUpdate" = false;
        "vsicons.dontShowNewVersionMessage" = true;
        "git.autofetch" = true;
      };
    };
  };
}
