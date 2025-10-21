{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Excal";
      user.email = "excalgames@duck.com";
      init.defaultBranch = "main";
      commit.gpgsign = true;
      user.signingkey = "52ED1E3B2D413D7A814B195C2593CAC242A94CE4";
    };
  };
}
