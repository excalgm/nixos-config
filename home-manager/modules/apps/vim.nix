{ pkgs, ... }: {
  programs.vim = {
    enable = true;
    packageConfigurable = pkgs.vim;
    settings.expandtab = true;
    settings.shiftwidth = 2;
    settings.tabstop = 8;
  };
}
