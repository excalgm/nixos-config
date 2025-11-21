{
  programs.nvf.settings.vim.languages.nix = {
    enable = true;
    format.enable = true;
    treesitter.enable = true;
    
    lsp = {
      enable = true;
      servers = ["nixd"];
    };
  };
}
