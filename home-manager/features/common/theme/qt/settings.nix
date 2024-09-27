{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit
    (lib)
    mkMerge
    mkIf
    ;

  qtctConf = {
    Appearance = {
      custom_palette = false;
      icon_theme = config.theme.gtk.icons.name;
      standard_dialogs = "xdgdesktopportal";
      style = "kvantum";
    };
  };

  cfg = config.settings.desktop;
  defaultFont = "${config.settings.fontSettings.sansSerif.family},${config.settings.fontSettings.sansSerif.size.str}";
in {
  # Setting up Qt.
  qt.platformTheme.name = mkMerge [
    (mkIf (cfg.gnome.enable) "adwaita")
    (mkIf (cfg.hyprland.enable) "qtct")
  ];

  home.packages = [
    pkgs.qt6Packages.qtstyleplugin-kvantum
    pkgs.qt6Packages.qt6ct
    pkgs.libsForQt5.qtstyleplugin-kvantum
    pkgs.libsForQt5.qt5ct
  ];

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=${config.theme.qt.name}
    '';

    "qt5ct/qt5ct.conf".text = let
      default = ''"${defaultFont},-1,5,50,0,0,0,0,0"'';
    in
      lib.generators.toINI {} (
        qtctConf
        // {
          Fonts = {
            fixed = default;
            general = default;
          };
        }
      );

    "qt6ct/qt6ct.conf".text = let
      default = ''"${defaultFont},-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular"'';
    in
      lib.generators.toINI {} (
        qtctConf
        // {
          Fonts = {
            fixed = default;
            general = default;
          };
        }
      );
  };
}
