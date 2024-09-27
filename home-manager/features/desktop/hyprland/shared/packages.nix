{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    home.packages = builtins.attrValues {
      inherit
        (pkgs)
        eog
        evince
        file-roller
        gedit
        gnome-disk-utility
        gnome-font-viewer
        gnome-system-monitor
        gnome-secrets
        ;
    };
  };
}
