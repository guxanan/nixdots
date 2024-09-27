{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.theme.gtk;

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
  options.theme.gtk = {
    enable = mkEnableOption "gtk";

    theme = {
      name = mkOption {
        type = nullOr str;
        default = null;
        example = "adwaita";
        description = "The GTK theme name.";
      };

      package = mkOption {
        type = nullOr (either package (listOf package));
        default = null;
        example = literalExpression "pkgs.catppuccin-gtk";
        description = "The GTK theme package.";
      };
    };

    icons = {
      name = mkOption {
        type = nullOr str;
        default = null;
        example = "adwaita";
        description = "The icon theme name.";
      };

      package = mkOption {
        type = nullOr (either package (listOf package));
        default = null;
        example = literalExpression "pkgs.yaru-theme";
        description = "The icon theme package.";
      };
    };
  };
}
