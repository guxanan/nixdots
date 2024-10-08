{
  config,
  lib,
  pkgs,
  ...
}: let
  colors-rofi = pkgs.writeText "colors-rofi.rasi" ''
    * {
        background: {{background}};
        foreground: {{foreground}};
        cursor: {{cursor}};

        color0: {{color0}};
        color1: {{color1}};
        color2: {{color2}};
        color3: {{color3}};
        color4: {{color4}};
        color5: {{color5}};
        color6: {{color6}};
        color7: {{color7}};
        color8: {{color8}};
        color9: {{color9}};
        color10: {{color10}};
        color11: {{color11}};
        color12: {{color12}};
        color13: {{color13}};
        color14: {{color14}};
        color15: {{color15}};

        color1-t2: rgba({{color1 | rgb}}, 0.2);
        color1-t7: rgba({{color1 | rgb}}, 0.7);
    }
  '';
in {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    programs.wallust.settings.templates.rofi = {
      template = "${colors-rofi}";
      target = "${config.xdg.configHome}/wallust/results/colors-rofi.rasi";
    };
  };
}
