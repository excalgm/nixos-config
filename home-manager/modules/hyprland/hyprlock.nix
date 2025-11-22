{ config, ... }: {
  programs.hyprlock = {
    enable = true;
    settings = {
      source = [
        "${config.programs.matugen.theme.files}/.config/hypr/colors.conf"
      ];

      "$font" = "Rubik Medium";

      general = {
        hide_cursor = true;
        grace = 5;
      };

      background = [
        {
        color = "$surface";
        }
      ];

      label = [
        {
          text = "$LAYOUT";
          color = "$on_surface";
          font_size = 14;
          font_family = "$font";
          position = "-30, 30";
          halign = "right";
          valign = "bottom";
        }
        {
          text = "$TIME";
          color = "$on_surface";
          font_size = 90;
          font_family = "$font";
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }
        {
          text = "cmd[update:43200000] date +\"%A, %d %B %Y\"";
          color = "$on_surface";
          font_size = 25;
          font_family = "$font";
          position = "-30, -150";
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
          outer_color = "$outline_variant";
          inner_color = "$surface_container";
          font_color = "$on_surface_variant";
          fade_on_empty = false;
          placeholder_text = "Password for <i>$USER</i>";
          hide_input = false;
          check_color = "$secondary";
          fail_color = "$error";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          capslock_color = "$tertiary";
          position = "0, -47";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
