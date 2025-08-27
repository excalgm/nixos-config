{
  programs.iamb = {
    enable = true;
    settings = {
      profiles.user.user_id = "@stanislav:excal.cc";
      notifications.enabled = true;
      image_preview = {
        protocol.type = "kitty"; 
        protocol.size = {
          height = 10;
          width = 66;
        };
      };
    };
  };
}
