{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit
    (lib)
    types
    mkOption
    ;
in {
  options.settings.desktop = {
    gnome.enable = mkOption {
      type = types.bool;
      default = false;
    };

    hyprland.enable = mkOption {
      type = types.bool;
      default = false;
    };

    plasma.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
}
