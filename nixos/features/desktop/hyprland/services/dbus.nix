{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    services.dbus.packages = builtins.attrValues {
      inherit
        (pkgs)
        gcr
        gnome-settings-daemon
        ;
    };
  };
}
