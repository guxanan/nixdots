{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    programs.matugen.settings.config = {
      reload_apsp = false;
      set_wallpaper = false;
      prefix = "@";
    };
  };
}
