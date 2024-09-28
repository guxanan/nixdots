{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    home.sessionVariables = {
      CLUTTER_BACKEND = "wayland";
      NIXOS_OZONE_WL = "1";

      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";

      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_QPA_PLATFORMTHEME = lib.mkForce "qt6ct";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

      WINEPREFIX = "${config.xdg.dataHome}/wine";

      EDITOR = "codium --wait";
      BROWSER = "firefox";
      TERMINAL = "kitty";
    };
  };
}
