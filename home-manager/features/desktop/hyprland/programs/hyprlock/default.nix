{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./settings.nix
  ];

  config = lib.mkIf config.settings.desktop.hyprland.enable {
    programs.hyprlock.enable = true;
  };
}
