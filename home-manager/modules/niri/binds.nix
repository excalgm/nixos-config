{ pkgs, config, ... }: let
  wpvol = pkgs.writeShellApplication {
    name = "wpvol";
    runtimeInputs = [ pkgs.bc pkgs.gawk ];
    text = ''
      #!/bin/bash

      # Get the volume level and convert it to a percentage
      volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
      if grep -q "MUTED" <<<"$volume"; then is_muted=true; else is_muted=false; fi
      volume=$(echo "$volume" | awk '{print $2}')
      volume=$(echo "( $volume * 100 ) / 1" | bc)

      if $is_muted; then
        notify-send -t 1000 -a 'wp-vol' -h "int:value:$volume" "Volume: Muted"
      else
        notify-send -t 1000 -a 'wp-vol' -h "int:value:$volume" "Volume: $volume %"
      fi
    '';
  };

  powermenu = pkgs.writeShellScriptBin "powermenu" ''
      #!/bin/bash
      SELECTION="$(printf "󰌾 Lock\n󰒲 Suspend\n Log out\n󰑓 Reboot\n⏻ Shutdown" | fuzzel --dmenu -l 5 -p '🖥️ ' --placeholder 'Power menu')"

      case $SELECTION in
      *"Lock")
        loginctl lock-session
        ;;
      *"Suspend")
        systemctl suspend
        ;;
      *"Log out")
        niri msg action quit
        ;;
      *"Reboot")
        systemctl reboot
        ;;
      *"Shutdown")
        systemctl poweroff
        ;;
      esac
    '';

  sh = config.lib.niri.actions.spawn "bash" "-c";
in {
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+Shift+Slash".action = show-hotkey-overlay;

    "Mod+Period".action = spawn "bemoji" "--noline";
    "Mod+Return".action = spawn "kitty";
    "Mod+D".action = spawn "fuzzel";
    "Mod+F1".action = spawn "${powermenu}/bin/powermenu";
    "Mod+F2".action = sh "pkill -SIGTERM waybar && waybar";
    "XF86AudioRaiseVolume" = {
      allow-when-locked = true;
      action = sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+ && ${wpvol}/bin/wpvol";
    };
    "XF86AudioLowerVolume" = {
      allow-when-locked = true;
      action = sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05- && ${wpvol}/bin/wpvol";
    };
    "XF86AudioMute" = {
      allow-when-locked = true;
      action = sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && ${wpvol}/bin/wpvol";
    };
    "XF86AudioMicMute" = {
      allow-when-locked = true;
      action = sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
    };

    "XF86MonBrightnessUp" = {
      allow-when-locked = true;
      action = spawn "brightnessctl" "set" "5%+";
    };
    "XF86MonBrightnessDown" = {
      allow-when-locked = true;
      action = spawn "brightnessctl" "set" "5%-";
    };

    "Mod+O" = {
      repeat = false;
      action = toggle-overview;
    };

    "Mod+Q".action = close-window;

    "Mod+Left".action  = focus-column-left;
    "Mod+H".action     = focus-column-left;
    "Mod+Down".action  = focus-window-or-workspace-down;
    "Mod+J".action     = focus-window-or-workspace-down;
    "Mod+Up".action    = focus-window-or-workspace-up;
    "Mod+K".action     = focus-window-or-workspace-up;
    "Mod+Right".action = focus-column-right;
    "Mod+L".action     = focus-column-right;
 
    "Mod+Shift+Left".action  = move-column-left;
    "Mod+Shift+H".action     = move-column-left;
    "Mod+Shift+Down".action  = move-window-down-or-to-workspace-down;
    "Mod+Shift+J".action     = move-window-down-or-to-workspace-down;
    "Mod+Shift+Up".action    = move-window-up-or-to-workspace-up;
    "Mod+Shift+K".action     = move-window-up-or-to-workspace-up;
    "Mod+Shift+Right".action = move-column-right;
    "Mod+Shift+L".action     = move-column-right;

    "Mod+Home".action       = focus-column-first;
    "Mod+Shift+Home".action = move-column-to-first;
    "Mod+End".action        = focus-column-last;
    "Mod+Shift+End".action  = move-column-to-last;
 
    "Mod+Ctrl+Left".action  = focus-monitor-left;
    "Mod+Ctrl+H".action     = focus-monitor-left;
    "Mod+Ctrl+Down".action  = focus-monitor-down;
    "Mod+Ctrl+J".action     = focus-monitor-down;
    "Mod+Ctrl+Up".action    = focus-monitor-up;
    "Mod+Ctrl+K".action     = focus-monitor-up;
    "Mod+Ctrl+Right".action = focus-monitor-right;
    "Mod+Ctrl+L".action     = focus-monitor-right;
  
    "Mod+Shift+Ctrl+Left".action  = move-column-to-monitor-left;
    "Mod+Shift+Ctrl+H".action     = move-column-to-monitor-left;
    "Mod+Shift+Ctrl+Down".action  = move-column-to-monitor-down;
    "Mod+Shift+Ctrl+J".action     = move-column-to-monitor-down;
    "Mod+Shift+Ctrl+Up".action    = move-column-to-monitor-up;
    "Mod+Shift+Ctrl+K".action     = move-column-to-monitor-up;
    "Mod+Shift+Ctrl+Right".action = move-column-to-monitor-right;
    "Mod+Shift+Ctrl+L".action     = move-column-to-monitor-right;

    "Mod+Page_Down".action = focus-workspace-down;
    "Mod+U".action         = focus-workspace-down;
    "Mod+Page_Up".action   = focus-workspace-up;
    "Mod+I".action         = focus-workspace-up;

    "Mod+Ctrl+Page_Down".action = move-workspace-down;
    "Mod+Ctrl+U".action         = move-workspace-down;
    "Mod+Ctrl+Page_Up".action   = move-workspace-up;
    "Mod+Ctrl+I".action         = move-workspace-up;

    "Mod+1".action = focus-workspace 1;
    "Mod+2".action = focus-workspace 2;
    "Mod+3".action = focus-workspace 3;
    "Mod+4".action = focus-workspace 4;
    "Mod+5".action = focus-workspace 5;
    "Mod+6".action = focus-workspace 6;
    "Mod+7".action = focus-workspace 7;
    "Mod+8".action = focus-workspace 8;
    "Mod+9".action = focus-workspace 9;
 
    "Mod+Shift+1".action = move-column-to-index 1;
    "Mod+Shift+2".action = move-column-to-index 2;
    "Mod+Shift+3".action = move-column-to-index 3;
    "Mod+Shift+4".action = move-column-to-index 4;
    "Mod+Shift+5".action = move-column-to-index 5;
    "Mod+Shift+6".action = move-column-to-index 6;
    "Mod+Shift+7".action = move-column-to-index 7;
    "Mod+Shift+8".action = move-column-to-index 8;
    "Mod+Shift+9".action = move-column-to-index 9;

    "Mod+BracketLeft".action  = consume-or-expel-window-left;
    "Mod+BracketRight".action = consume-or-expel-window-right;

    "Mod+R".action = switch-preset-column-width;
    "Mod+Shift+R".action = switch-preset-window-height;
    "Mod+Ctrl+R".action = reset-window-height;
    "Mod+F".action = maximize-column;
    "Mod+Shift+F".action = fullscreen-window;
    "Mod+Ctrl+F".action = expand-column-to-available-width;

    "Mod+C".action = center-column;

    "Mod+Minus".action = set-column-width "-10%";
    "Mod+Equal".action = set-column-width "+10%";
    "Mod+Shift+Minus".action = set-window-height "-10%";
    "Mod+Shift+Equal".action = set-window-height "+10%";

    "Mod+V".action = toggle-window-floating;
    "Mod+Shift+V".action = switch-focus-between-floating-and-tiling;

    "Mod+W".action = toggle-column-tabbed-display;

    "Print".action = screenshot;
    "Mod+Print".action = screenshot-window;

    "Mod+Escape" = {
      allow-inhibiting = false;
      action = toggle-keyboard-shortcuts-inhibit;
    };

    "Mod+Shift+E".action = quit;
    "Ctrl+Alt+Delete".action = quit;

    "Mod+Shift+P".action = power-off-monitors;
  };
}
