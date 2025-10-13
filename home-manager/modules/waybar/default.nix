{
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [
          "cpu"
          "memory"
          "clock"
          "idle_inhibitor"
        ];
        modules-center = [ "niri/workspaces" ];
        modules-right = [
          "group/systray"
          "battery"
          "backlight"
          "wireplumber"
          "niri/language"
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
        "niri/workspaces" = {
          format = "{index}";
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
          format-linked = "󰲝 Connected w/o IP";
          format-disconnected = "󰲜 Disconnected";
          format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
          tooltip-format = "{ifname} via {gwaddr}\nIP: {ipaddr}/{cidr}";
        };
        "niri/language" = {
          format = "󰗊 {short}";
        };
        "backlight" = {
          format = "{icon} <b>{percent}%</b>";
          format-icons = [ "󰃞" "󰃟" "󰃠" ];
          tooltip = false;
        };
        "clock" = {
          format = " {:%H:%M}";
          format-alt = "󰃭 {:%d.%m.%Y}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "󰈈";
            deactivated = "󰈉";
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