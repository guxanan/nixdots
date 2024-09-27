{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  colors-waybar = pkgs.writeText "colors-waybar.css" ''
    <* for name, value in colors *>
    @define-color {{name}} {{value.default.hex}};
    <* endfor *>
  '';
in {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    programs.matugen.settings.templates.waybar = {
      input_path = "${colors-waybar}";
      output_path = "${config.xdg.configHome}/matugen/results/colors-waybar.css";
    };
  };
}
