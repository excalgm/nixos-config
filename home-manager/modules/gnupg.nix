{
  programs.gpg = {
    enable = true;
    settings = {
      keyserver = "hkps://keys.openpgp.org";
    };
  };
  services.gpg-agent = {
    enable = true;
  };
}