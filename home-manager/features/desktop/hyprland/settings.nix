{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      monitor = [
        "DP-2, 1920x1080@60, 0x0, 1"
      ];

      envd = with builtins;
        attrValues
        (
          mapAttrs
          (name: value: "${name}, ${toString value}")
          config.home.sessionVariables
        );

      general = {
        border_size = 2;
        gaps_in = 2;
        gaps_out = 2;
        "col.active_border" = "${config.colors.catppuccin.mocha.hypr.red "B3"}";
        "col.inactive_border" = "${config.colors.catppuccin.mocha.hypr.surface0 "FF"}";
        layout = "dwindle";
      };

      decoration = {
        drop_shadow = false;
        rounding = 20;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(292D35EE)";

        blur = {
          enabled = true;
          new_optimizations = true;
          size = 4;
          passes = 3;
          noise = 0.0117;
          contrast = 1.3000;
          brightness = 0.8000;
          vibrancy = 0.2100;
          vibrancy_darkness = 0.0;
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 6, myBezier"
          "windowsIn, 1, 6, myBezier"
          "windowsMove, 1, 5, myBezier"
          "windowsOut, 1, 5, default, popin 80%"
          "border, 1, 1, default"
          "borderangle, 1, 30, default"
          "fade, 1, 10, default"
          "workspaces, 1, 5, default"
        ];
      };

      input = {
        kb_layout = "us,it,ro";
        kb_options = "grp:win_space_toggle";
        repeat_rate = 25;
        repeat_delay = 600;
        follow_mouse = 1;
        sensitivity = 0;
        accel_profile = "flat";
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        vfr = true;
        vrr = 0;
      };

      windowrulev2 = [
        # rofi
        "stayfocused,class:(rofi)"

        # file-roller
        "center,title:(Extract)"

        # wlogout
        "fullscreen,class:(wlogout)"
        "float,class:(wlogout)"

        # nmtui
        "float,class:(nmtui)"

        # fixing qt weirdness
        "noblur on,class:(dolphin-emu)"
        "noblur on,class:(ark)"
        "noblur on,class:(Xdg-desktop-portal-gtk)"

        # steam
        "float,class:(steam),title:(Steam Settings)"
      ];

      layerrule = [
        "blur, waybar"
        "blur, rofi"
        "blur, logout_dialog"
        "blur, notifications"
        "ignorealpha 0, waybar"
        "ignorealpha 0, rofi"
        "ignorealpha 0, notifications"
      ];

      "$mod" = "SUPER";

      bind = [
        "$mod, RETURN, exec, kitty"
        "$mod, Q, killactive"
        "$mod, F, fullscreen,"
        "$mod, C, togglefloating,"

        # App Shortcuts
        "$mod, S, exec, rofi-launcher"
        "ALT, TAB, exec, rofi -show window"
        "$mod, period, exec, rofi -show emoji"

        "$mod, V, exec, nautilus"
        "$mod, B, exec, firefox"
        "$mod, M, exec, thunderbird"
        "$mod, K, exec, keepassxc"
        "$mod, P, exec, seahorse"
        "$mod, W, exec, rofi-wallpaper"
        "$mod, L, exec, ${lib.getExe pkgs.hyprlock}"
        "$mod, T, exec, pkill waybar && waybar"
        "$mod, R, exec, ${lib.getExe pkgs.reload}"

        # Move focus with mainMod + arrow keys
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        # Scroll through existing workspaces with mainMod + scroll
        "$mod, mouse_down, workspace, -1"
        "$mod, mouse_up, workspace, +1"
        "$mod, next, workspace, +1"
        "$mod, prior, workspace, -1"

        # Screenshots
        ", Print, exec, ${lib.getExe pkgs.screenshot} screen"
        "CTRL, Print, exec, ${lib.getExe pkgs.screenshot} active"
        "SHIFT, Print, exec, ${lib.getExe pkgs.screenshot} area"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bindl = [
        ", Caps_Lock, exec, sleep 0.3 && swayosd-client --caps-lock"
        ", Num_Lock, exec, sleep 0.3 && swayosd-client --num-lock"
        ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle && ${lib.getExe pkgs.volume-ux}"
      ];

      bindle = [
        # Media - Audio
        ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower && ${lib.getExe pkgs.volume-ux}"
        ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise && ${lib.getExe pkgs.volume-ux}"
        ", XF86MonBrightnessDown, exec, swayosd-client --brightness lower"
        ", XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
      ];
    };
  };
}
