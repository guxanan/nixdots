{
  config,
  lib,
  pkgs,
  ...
}: let
  colors-waybar = pkgs.writeText "colors-waybar.css" ''
    @define-color background {{background}};
    @define-color foreground {{foreground}};
    @define-color cursor {{cursor}};

    @define-color color0 {{color0}};
    @define-color color1 {{color1}};
    @define-color color2 {{color2}};
    @define-color color3 {{color3}};
    @define-color color4 {{color4}};
    @define-color color5 {{color5}};
    @define-color color6 {{color6}};
    @define-color color7 {{color7}};
    @define-color color8 {{color8}};
    @define-color color9 {{color9}};
    @define-color color10 {{color10}};
    @define-color color11 {{color11}};
    @define-color color12 {{color12}};
    @define-color color13 {{color13}};
    @define-color color14 {{color14}};
    @define-color color15 {{color15}};

    @define-color background-t7 rgba({{background | rgb}}, 0.7);
    @define-color color1-t2 rgba({{color1 | rgb}}, 0.2);
    @define-color color1-t7 rgba({{color1 | rgb}}, 0.7);
  '';
in {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    programs.wallust.settings.templates.waybar = {
      template = "${colors-waybar}";
      target = "${config.xdg.configHome}/wallust/results/colors-waybar.css";
    };
  };
}
