{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit
    (pkgs.gnomeExtensions)
    alphabetical-app-grid
    appindicator
    blur-my-shell
    gsconnect
    launch-new-instance
    user-themes
    vitals
    ;
in {
  config = lib.mkIf config.settings.desktop.gnome.enable {
    home.packages = [
      alphabetical-app-grid
      appindicator
      blur-my-shell
      gsconnect
      vitals
    ];

    dconf.settings = {
      "org/gnome/shell".enabled-extensions = [
        # Inbuilt
        launch-new-instance.extensionUuid
        user-themes.extensionUuid

        # Installed
        alphabetical-app-grid.extensionUuid
        appindicator.extensionUuid
        blur-my-shell.extensionUuid
        gsconnect.extensionUuid
        vitals.extensionUuid
      ];

      "org/gnome/shell/extensions/vitals" = {
        fixed-widths = true;
        show-network = false;
        show-storage = false;
        show-system = false;
        show-voltage = false;
        hot-sensors = [
          "_temperature_amdgpu_edge_"
          "_temperature_k10temp_tctl_"
          "_memory_usage_"
        ];
      };

      "org/gnome/shell/extensions/user-theme" = {
        name = "${config.gtk.theme.name}";
      };
    };
  };
}
