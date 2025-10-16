{
  imports = [
    ./markdown.nix
    ./nix.nix
    ./python.nix
  ];

  programs.nvf.settings.vim.languages = {
    enableTreesitter = true;
  };
}
