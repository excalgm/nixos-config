{
  programs.git = {
    enable = true;
    extraConfig = {
      user.name = "Excal";
      user.email = "excalgames@duck.com";
      init.defaultBranch = "main";
      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };
}