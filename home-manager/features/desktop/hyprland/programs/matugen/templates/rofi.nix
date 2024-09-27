{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  colors-rofi = pkgs.writeText "colors-rofi.rasi" ''
    * {
        <* for name, value in colors *>
        {{name}}: {{value.default.hex}};
        <* endfor *>
    }
  '';
in {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    programs.matugen.settings.templates.rofi = {
      input_path = "${colors-rofi}";
      output_path = "${config.xdg.configHome}/matugen/results/colors-rofi.rasi";
    };
  };
}
