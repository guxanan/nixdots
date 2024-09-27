{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    security = {
      polkit.enable = true;
      pam.services.hyprlock = {};
    };
  };
}
