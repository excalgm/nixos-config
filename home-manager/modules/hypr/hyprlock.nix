{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        grace = 5;
      };
      background = [
        {
        color = "rgb(282828)";
        }
      ];
      label = [
        {
          text = "$LAYOUT";
          color = "rgb(ebdbb2)";
          font_size = 14;
          font_family = "JetBrainsMono Nerd Font";
          position = "-30, 30";
          halign = "right";
          valign = "bottom";
        }
        {
          text = "$TIME";
          color = "rgb(ebdbb2)";
          font_size = 90;
          font_family = "JetBrainsMono Nerd Font";
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }
      ];
      input-field = [
        {
          size = "300, 60";
          outline_thickness = 4;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "rgb(b8bb26)";
          inner_color = "rgb(665c54)";
          font_color = "rgb(ebdbb2)";
          fade_on_empty = false;
          hide_input = false;
          check_color = "rgb(b8bb26)";
          fail_color = "rgb(fb4934)";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          capslock_color = "rgb(fabd2f)";
          position = "0, -47";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}