{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: let
  cfg = config.programs.matugen;
  tomlFormat = pkgs.formats.toml {};

  inherit
    (lib)
    literalExpression
    mkEnableOption
    mkIf
    mkOption
    types
    ;

  inherit
    (lib.types)
    attrsOf
    bool
    either
    int
    listOf
    str
    ;
in {
  options.programs.matugen = {
    enable = mkEnableOption "matugen";

    package = mkOption {
      type = types.package;
      default = pkgs.matugen;
      defaultText = literalExpression "pkgs.matugen";
      description = "The package to use for the matugen.";
    };

    settings = mkOption {
      type = let
        prim = either bool (either int str);
        primOrPrimAttrs = either prim (attrsOf prim);
        entry = either prim (listOf primOrPrimAttrs);
        entryOrAttrsOf = t: either entry (attrsOf t);
        entries = entryOrAttrsOf (entryOrAttrsOf entry);
      in
        attrsOf entries // {description = "Matugen configuration";};
      default = {};
      example = literalExpression ''
        {
          config = {
            reload_apps = true;
            set_wallpaper = true;
            wallpaper_tool = "Swww";
            prefix = "@";
            swww_options = [
              "--transition-type"
              "center"
            ];
            run_after = [
              [ "echo" "'hello'" ]
              [ "echo" "'hello again'" ]
            ];
          };

          "config.reload_apps_list" = {
            waybar = true;
            kitty = true;
            gtk_theme = true;
            dunst = true;
          };

          "templates.test" = {
            input_path = ~/.config/example/template.css;
            output_path = ~/.config/example;
          };
        }
      '';
      description = ''
        Configuration written to
        {file}`$XDG_CONFIG_HOME/matugen/config.toml`.
      '';
    };
  };

  config = mkIf cfg.enable {
    home.packages = [
      cfg.package
      pkgs.swww
    ];

    xdg.configFile."matugen/config.toml" = mkIf (cfg.settings != {}) {
      source = tomlFormat.generate "matugen-config" cfg.settings;
    };
  };
}
