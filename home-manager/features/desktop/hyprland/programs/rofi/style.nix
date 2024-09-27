{
  config,
  lib,
  pkgs,
  ...
}: let
  rofi-style-common = pkgs.writeText "rofi-style-common.rasi" ''
    * {
        border-color: ${config.colors.catppuccin.mocha.rgba.surface0 1.0};
        selected-color: ${config.colors.catppuccin.mocha.rgba.base 1.0};
        background-color: ${config.colors.catppuccin.mocha.rgba.crust 1.0};
        text-color: ${config.colors.catppuccin.mocha.rgba.text 1.0};
    }
  '';
in {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    programs.rofi.theme = "${rofi-style-common}";
  };
}
