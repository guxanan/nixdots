{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    programs.browserpass = {
      enable = true;
    };
  };
}
