{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit
    (lib)
    mkIf
    ;

  cfg = config.settings.desktop;
in {
  gtk = {
    cursorTheme = {
      name = config.theme.cursor.name;
      package = config.theme.cursor.package;
      size = config.theme.cursor.size;
    };

    font = {
      name = config.settings.fontSettings.sansSerif.family;
      size = config.settings.fontSettings.sansSerif.size.int;
    };

    gtk3.bookmarks = builtins.map (dir: "file://${dir}") (builtins.attrValues config.xdg.userDirs.extraConfig);

    iconTheme = mkIf (!cfg.plasma.enable) {
      name = config.theme.gtk.icons.name;
      package = config.theme.gtk.icons.package;
    };

    theme = mkIf (!cfg.plasma.enable) {
      name = config.theme.gtk.theme.name;
      package = config.theme.gtk.theme.package;
    };
  };
}
