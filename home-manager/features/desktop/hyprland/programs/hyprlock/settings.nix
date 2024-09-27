{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    programs.hyprlock.settings = {
      general = {
        hide_cursor = true;
      };

      background = {
        path = "${config.xdg.configHome}/background";
        blur_size = 4;
        blur_passes = 3;
        noise = 0.0117;
        contrast = 1.3000;
        brightness = 0.8000;
        vibrancy = 0.2100;
        vibrancy_darkness = 0.0;
      };

      # Time
      label = [
        {
          text = "$TIME";
          color = "${config.colors.catppuccin.mocha.hypr.text "FF"}";
          font_size = 64;
          font_family = "${config.settings.fontSettings.monospace.family}";
          position = "0, 75";
          halign = "center";
          valign = "center";
        }

        {
          text = "『$USER』";
          color = "${config.colors.catppuccin.mocha.hypr.text "FF"}";
          font_size = 20;
          font_family = "${config.settings.fontSettings.monospace.family}";
          position = "0, 0";
          halign = "center";
          valign = "center";
        }

        {
          text = "Type to unlock!";
          color = "${config.colors.catppuccin.mocha.hypr.text "FF"}";
          font_size = 16;
          font_family = "${config.settings.fontSettings.monospace.family}";
          position = "0, 30";
          halign = "center";
          valign = "bottom";
        }
      ];

      # Password prompt
      input-field = {
        size = "250, 50";
        outline_thickness = 2;
        dots_size = 0.2;
        dots_spacing = 0.64;
        dots_center = true;
        outer_color = "${config.colors.catppuccin.mocha.hypr.surface0 "FF"}";
        inner_color = "${config.colors.catppuccin.mocha.hypr.crust "FF"}";
        font_color = "${config.colors.catppuccin.mocha.hypr.text "FF"}";
        fade_on_empty = true;
        placeholder_text = "<i>Password...</i>";
        hide_input = false;
        position = "0, 80";
        halign = "center";
        valign = "bottom";
      };
    };
  };
}
