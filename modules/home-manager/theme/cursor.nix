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
  options.theme.cursor = {
    name = mkOption {
      type = types.str;
      default = "Bibata-Modern-Classic";
      description = "The cursor theme name.";
    };

    package = mkOption {
      type = types.package;
      default = pkgs.bibata-cursors;
      description = "The cursor theme package.";
    };

    size = mkOption {
      type = types.number;
      default = 24;
      description = "The cursor theme size.";
    };
  };
}
