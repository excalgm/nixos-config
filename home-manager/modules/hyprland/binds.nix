{ pkgs, ... }: let
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
in {
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mainMod SHIFT, W, exit,"
      "$mainMod SHIFT, Q, killactive,"
      "$mainMod, F, fullscreen,"
      "$mainMod, V, togglefloating,"
      "$mainMod, P, pseudo," #dwindle
      "$mainMod, J, togglesplit," #dwindle

      "$mainMod, Return, exec, $terminal"

      "$mainMod, D, exec, $menu"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, F1, exec, uwsm-app -- ${powermenu}/bin/powermenu"
      "$mainMod, B, exec, uwsm-app -- cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"
      "$mainMod SHIFT, B, exec, uwsm-app -- cliphist list | fuzzel --dmenu | cliphist delete"

      ", Print, exec, uwsm-app -- hyprshot -z -m region --clipboard-only"
      "SHIFT, Print, exec, uwsm-app -- hyprshot -z -m output -m active --clipboard-only"
      "$mainMod, Print, exec, uwsm-app -- hyprshot -z -m window --clipboard-only"

      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      "$mainMod SHIFT, left, movewindow, l"
      "$mainMod SHIFT, right, movewindow, r"
      "$mainMod SHIFT, up, movewindow, u"
      "$mainMod SHIFT, down, movewindow, d"

      "$mainMod CTRL, left, resizeactive, -10 0"
      "$mainMod CTRL, right, resizeactive, 10 0"
      "$mainMod CTRL, up, resizeactive, 0 -10"
      "$mainMod CTRL, down, resizeactive, 0 10"

      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"

      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"

      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    bindel = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl set 5%+"
      ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
    ];

    bindl = [
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
    ];
  };
}
