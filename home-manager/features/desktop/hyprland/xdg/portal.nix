{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    # File picker, Hyprland portal doesn't implement one.
    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config.common.default = ["gtk"];
      config.hyprland.default = ["gtk" "hyprland"];
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
    };
  };
}
