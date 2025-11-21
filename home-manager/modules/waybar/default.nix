{ config, ... }: {
  programs.waybar = {
    enable = true;
    style = ''
      @import "${config.programs.matugen.theme.files}/.config/waybar/colors.css";
      ${builtins.readFile ./style.css}
    '';
    systemd = {
      enable = true;
      target = "graphical-session.target";
    };
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 36;
        spacing = 4;
        modules-left = [
          "custom/icon"
          "clock"
          "cpu"
          "memory"
          "idle_inhibitor"
        ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [
          "group/systray"
          "backlight"
          "wireplumber"
          "battery"
          "hyprland/language"
          "network"
        ];

        "cpu" = {
          format = " {usage}%";
          interval = 5;
        };

        "memory" = {
          format = " {percentage}%";
          interval = 5;
        };

        "hyprland/workspaces" = {
          format = "{icon} {name}";
          on-click = "activate";
          all-outputs = true;
          format-icons = {
            urgent = "";
            active = "";
            default = "";
          };
          persistent-workspaces = {
            "*" = 10;
          };
        };

        "battery" = {
          format = "{icon} {capacity}%";
          format-icons = [ "" "" "" "" "" ];
        };

        "wireplumber" = {
          format = "󰕾 {volume}%";
          format-muted = "󰖁 <s>{volume}%</s>";
        };

        "network" = {
          format-wifi = "{icon} {essid}";
          format-ethernet = "󰈀 Ethernet";
          format-disconnected = "󰲜 Disconnected";
          format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
          tooltip-format = "{ifname} via {gwaddr}\nIP: {ipaddr}/{cidr}";
        };

        "hyprland/language" = {
          format = "󰗊 {short}";
        };

        "custom/icon" = {
          format = "";
          on-click = "uwsm-app -- fuzzel";
          tooltip = false;
        };
        
        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = [ "󰃞" "󰃟" "󰃠" ];
          tooltip = false;
        };

        "clock" = {
          format = "󰥔 {:%H:%M}";
          format-alt = "󰃭 {:%d.%m.%Y}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "󰈉";
            deactivated = "󰈈";
          };
        };

        "custom/tray_arrow" = {
          format = "";
        };
        "group/systray" = {
          orientation = "horizontal";
          drawer = {
            transition-duration = 500;
            transition-left-to-right = true;
            click-to-reveal = true;
          };
          modules = [ "custom/tray_arrow" "tray" ];
        };
        "tray" = {
          icon-size = 18;
          spacing = 10;
        };
      };
    };
  };
}
