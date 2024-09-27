{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.programs.wallust;
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
  options.programs.wallust = {
    enable = mkEnableOption "wallust";

    package = mkOption {
      type = types.package;
      default = pkgs.wallust;
      defaultText = literalExpression "pkgs.wallust";
      description = "The package to use for the wallust.";
    };

    settings = mkOption {
      type = let
        prim = either bool (either int str);
        primOrPrimAttrs = either prim (attrsOf prim);
        entry = either prim (listOf primOrPrimAttrs);
        entryOrAttrsOf = t: either entry (attrsOf t);
        entries = entryOrAttrsOf (entryOrAttrsOf entry);
      in
        attrsOf entries // {description = "Wallust configuration";};
      default = {};
      example = literalExpression ''
        {
          backend = "resized";
          color_space = "lab";
          threshold = 20;
          palette = "dark";
          templates = {
            zathura = {
              template = "zathura";
              target = "~/.config/zathura/zathurarc";
            };
          };
        }
      '';
      description = ''
        Configuration written to
        {file}`$XDG_CONFIG_HOME/wallust/wallust.toml`.
      '';
    };
  };

  config = mkIf cfg.enable {
    home.packages = [cfg.package];

    xdg.configFile."wallust/wallust.toml" = mkIf (cfg.settings != {}) {
      source = tomlFormat.generate "wallust-config" cfg.settings;
    };

    programs.zsh.initExtra = ''
      # Import colorscheme from 'wal' asynchronously
      # &   # Run the process in the background.
      # ( ) # Hide shell job control messages.
      (cat ${config.xdg.cacheHome}/wallust/sequences &)
    '';

    programs.rofi.theme = lib.mkDefault {
      "@import" = "${config.xdg.configHome}/wallust/results/colors-rofi.rasi";
    };
  };
}
