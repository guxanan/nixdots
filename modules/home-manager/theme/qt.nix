{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.theme.qt;

  inherit
    (lib)
    types
    mkOption
    mkIf
    mkEnableOption
    literalExpression
    ;

  inherit
    (lib.types)
    nullOr
    str
    either
    package
    listOf
    ;
in {
  options.theme.qt = {
    enable = mkEnableOption "qt";

    name = mkOption {
      type = nullOr str;
      default = null;
      example = "adwaita";
      description = "The Qt theme name.";
    };

    package = mkOption {
      type = nullOr (either package (listOf package));
      default = null;
      example = literalExpression "[pkgs.adwaita-qt pkgs.adwaita-qt6]";
      description = "The Qt theme package.";
    };
  };

  config = mkIf (cfg.enable && cfg.package != null) {
    home.packages = cfg.package;
  };
}
