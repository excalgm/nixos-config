{
  programs.nvf.settings.vim.languages.python = {
    enable = true;
    lsp.enable = true;
    treesitter.enable = true;

    format = {
      enable = true;
      type = ["ruff"];
    };
  };
}
