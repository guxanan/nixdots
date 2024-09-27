{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./dbus.nix
    ./greetd.nix
  ];

  config = lib.mkIf config.settings.desktop.hyprland.enable {
    services = {
      gvfs.enable = true;
      power-profiles-daemon.enable = true;
    };
  };
}
