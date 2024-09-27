{
  config,
  lib,
  ...
}: let
  inherit
    (lib)
    mkOption
    types
    strings
    ;

  mkFontOption = kind: {
    family = mkOption {
      type = types.str;
      default = null;
      description = "Family name for ${kind} font profile";
      example = "Fira Code";
    };

    weight = mkOption {
      type = types.str;
      default = null;
      description = "The font type.";
    };

    size = {
      int = mkOption {
        type = types.int;
        default = null;
        description = "The font size integer.";
      };

      str = mkOption {
        type = types.str;
        default = null;
        description = "The font size string.";
      };
    };

    full = mkOption {
      type = types.str;
      default = null;
      description = "Combined full font name.";
    };
  };

  cfg = config.settings.fontSettings;
in {
  options.settings.fontSettings = {
    enable = lib.mkEnableOption "Whether to enable font profiles";
    emoji = mkFontOption "emoji";
    monospace = mkFontOption "monospace";
    sansSerif = mkFontOption "sansSerif";
    serif = mkFontOption "serif";
  };

  config = lib.mkIf cfg.enable {
    settings.fontSettings = {
      emoji.family = builtins.elemAt config.fonts.fontconfig.defaultFonts.emoji 0;
      monospace.family = builtins.elemAt config.fonts.fontconfig.defaultFonts.monospace 0;
      sansSerif.family = builtins.elemAt config.fonts.fontconfig.defaultFonts.sansSerif 0;
      serif.family = builtins.elemAt config.fonts.fontconfig.defaultFonts.serif 0;

      emoji.size.str = builtins.toString config.settings.fontSettings.emoji.size.int;
      monospace.size.str = builtins.toString config.settings.fontSettings.monospace.size.int;
      sansSerif.size.str = builtins.toString config.settings.fontSettings.sansSerif.size.int;
      serif.size.str = builtins.toString config.settings.fontSettings.serif.size.int;

      monospace.full = strings.concatStringsSep " " [
        cfg.monospace.family
        cfg.monospace.weight
        cfg.monospace.size.str
      ];

      sansSerif.full = strings.concatStringsSep " " [
        cfg.sansSerif.family
        cfg.sansSerif.weight
        cfg.sansSerif.size.str
      ];
    };
  };
}
