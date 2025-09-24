{
  security = {
    polkit.enable = true;
    sudo.enable = false;
    sudo-rs.enable = true;
    pam = {
      sshAgentAuth.enable = true;
    };
  };
}
